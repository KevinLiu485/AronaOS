//! Implementation of [`MapArea`] and [`MemorySet`].
use super::{frame_alloc, FrameTracker};
use super::{PTEFlags, PageTable, PageTableEntry};
use super::{PhysPageNum, VirtAddr, VirtPageNum};
use super::{StepByOne, VPNRange};
#[allow(unused)]
use crate::boards::vf2::{VF2_RAMFS_BASE, VF2_RAMFS_SIZE};
use crate::config::{SysResult, KERNEL_BASE, MEMORY_END, MMIO, PAGE_SIZE, USER_STACK_SIZE};
use crate::mutex::SpinNoIrqLock;
use crate::signal::sigreturn_trampoline;
use crate::task::aux::*;
use crate::utils::SyscallErr;
use crate::SyscallRet;
use crate::{MMAP_MIN_ADDR, USER_MAX_VA};
// use crate::MMAP_MIN_ADDR;
// use crate::console::print;
use crate::fs::inode::Inode;
use crate::fs::{open_inode, OSInode, OpenFlags, AT_FDCWD};
use crate::utils::block_on::block_on;
use alloc::collections::BTreeMap;
use alloc::string::{String, ToString};
use alloc::sync::Arc;
use alloc::vec;
use alloc::vec::Vec;
use core::arch::asm;
use core::fmt::Debug;
use lazy_static::lazy_static;
use log::{debug, info, trace, warn};
use riscv::register::satp;
use xmas_elf::program::Type;
use xmas_elf::ElfFile;

#[allow(unused)]
extern "C" {
    fn stext();
    fn etext();
    fn srodata();
    fn erodata();
    fn sdata();
    fn edata();
    fn sbss_with_stack();
    fn ebss();
    fn ekernel();
}

lazy_static! {
    /// a memory set instance through lazy_static! managing kernel space
    pub static ref KERNEL_SPACE: Arc<SpinNoIrqLock<MemorySet>> =
        Arc::new(SpinNoIrqLock::new(MemorySet::new_kernel()) );
}

/// Dynamic linked interpreter address range in user space
pub const DL_INTERP_OFFSET: usize = 0x20_0000_0000;

// /// kernel_space
// pub static mut KERNEL_SPACE: Option<MemorySet> = None;
// pub fn init_kernel_space() {
//     unsafe {
//         KERNEL_SPACE = Some(MemorySet::new_kernel());
//     }
// }

///Get kernelspace root ppn
pub fn kernel_token() -> usize {
    KERNEL_SPACE.lock().token()
}
/// memory set structure, controls virtual-memory space
pub struct MemorySet {
    /// page table
    pub page_table: PageTable,
    /// Todo!: 使用树来管理MapArea
    pub areas: Vec<MapArea>,
    /// 不放在areas是因为heap在运行时可能通过syscall改变
    /// kernel不含有heap, 当from_elf和from_exist_user时分配
    /// Option是因为Kernel没有, from_global是不分配heap
    pub heap: Option<MapArea>,
    pub brk: usize,
    /// we take a simple but powerful strategy to manage mmap
    /// mmap starts from [`MMAP_MIN_ADDR`], only increases, never decreases
    /// in this way, no memory waste, no conflict, only [`MMAPFLAGS::MAP_FIXED`] cannot be supported
    pub mmap_start: usize,
}

impl MemorySet {
    ///Create an empty `MemorySet`
    pub fn new_bare() -> Self {
        Self {
            page_table: PageTable::new(),
            areas: Vec::new(),
            heap: None,
            brk: 0,
            mmap_start: MMAP_MIN_ADDR,
        }
    }
    /// Create a user `MemorySet` that owns the global kernel mapping
    pub fn new_from_global() -> Self {
        let page_table = PageTable::from_global();
        Self {
            page_table,
            areas: Vec::new(),
            heap: None,
            // user的brk在from_elf和from_existed_user中设置
            brk: 0,
            mmap_start: MMAP_MIN_ADDR,
        }
    }
    ///Get pagetable `root_ppn`
    pub fn token(&self) -> usize {
        self.page_table.token()
    }
    /// Assume that no conflicts, 由caller保证
    pub fn insert_framed_area(&mut self, vpn_range: VPNRange, permission: MapPermission) {
        self.push(
            MapArea::from_vpn_range(vpn_range, MapType::Framed, permission),
            None,
            0,
        );
    }

    /// used for lazy allocation
    pub fn insert_anonymous_area(&mut self, vpn_range: VPNRange, permission: MapPermission) {
        self.push(
            MapArea::from_vpn_range(vpn_range, MapType::Anonymous, permission),
            None,
            0,
        )
    }

    /// allocate physical frame, update pagetable entry, insert frame into area.data_frames
    /// only used for anonymous
    pub fn manual_alloc_for_lazy(&mut self, vpn: VirtPageNum) -> Result<(), SyscallErr> {
        if let Some(pte) = self.page_table.find_pte(vpn) {
            if pte.ppn() == PhysPageNum::from(0) {
                for area in self.areas.iter_mut().rev() {
                    if area.vpn_range.contains(vpn) {
                        let frame = frame_alloc().unwrap();
                        let ppn = frame.ppn;
                        info!("[manual_alloc_for_lazy] vpn: {:?}, ppn: {:?}", vpn, ppn);
                        *pte = PageTableEntry::new(ppn, pte.flags());
                        area.data_frames.insert(vpn, Arc::new(frame));
                        return Ok(());
                    }
                }
            } else {
                return Ok(());
            }
        }
        return Err(SyscallErr::EINVAL);
    }

    ///Remove `MapArea` that starts with `start_vpn`
    pub fn remove_area_with_start_vpn(&mut self, start_vpn: VirtPageNum) {
        if let Some((idx, area)) = self
            .areas
            .iter_mut()
            .enumerate()
            .find(|(_, area)| area.vpn_range.get_start() == start_vpn)
        {
            area.unmap(&mut self.page_table);
            self.areas.remove(idx);
        }
    }

    /// Remove MapAreas在页表中的映射和释放对应的物理页帧
    /// Remove MapAreas在页表中的映射和释放对应数据页的物理页帧
    /// **调用remove_areas后一定要刷新TLB**
    /// especially used for sys_munmap
    pub fn remove_areas(&mut self, areas: Vec<MapArea>) {
        for mut area in areas {
            area.unmap(&mut self.page_table);
        }
    }
    /// especially used for sys_mmap
    /// no conflict will happen, because mmap_start is monotonically increasing
    pub fn get_unmapped_area(&self, start: usize, len: usize) -> Option<VPNRange> {
        let end = start + len;
        if end > USER_MAX_VA + 1 {
            warn!("[sys_mmap] out of mmap virtual memory space");
            return None;
        }
        let start_vpn = VirtAddr::from(start).floor();
        let end_vpn = VirtAddr::from(end).ceil();
        Some(VPNRange::new(start_vpn, end_vpn))
    }
    /// map_offset says data's offset in the first page
    fn push(&mut self, mut map_area: MapArea, data: Option<&[u8]>, map_offset: usize) {
        map_area.map(&mut self.page_table);
        if let Some(data) = data {
            map_area.copy_data(&mut self.page_table, data, map_offset);
        }
        self.areas.push(map_area);
    }
    /// filter out the area that is overlapped with [start, start + len)
    /// not remove the overlap areas from Memoryset
    pub fn filter_overlap(&self, start: usize, len: usize) -> Vec<&MapArea> {
        let end = start + len;
        let rm_range = VPNRange::new(VirtAddr::from(start).floor(), VirtAddr::from(end).ceil());
        let mut overlap_areas = Vec::new();
        self.areas.iter().for_each(|area| {
            if area.vpn_range.is_overlap(rm_range) {
                overlap_areas.push(area);
            }
        });
        overlap_areas
    }
    /// wipe out the area that is overlapped with [start, start + len)
    /// remove the overlap areas from Memoryset, **页表映射的清除由调用者负责**
    /// especially used for do_unmap
    pub fn wipe_overlap(&mut self, start: usize, len: usize) -> Vec<MapArea> {
        let end = start + len;
        let rm_range = VPNRange::new(VirtAddr::from(start).floor(), VirtAddr::from(end).ceil());
        let mut overlap_areas = Vec::new();
        let mut prev_areas = Vec::new();
        self.areas.drain(..).for_each(|area| {
            if area.vpn_range.is_overlap(rm_range) {
                overlap_areas.push(area);
            } else {
                prev_areas.push(area);
            }
        });
        // 更新memory_set.areas
        self.areas = prev_areas;
        overlap_areas
    }
    /// especially used for sys_munmap and sys_mmap
    /// 参数合法性由调用者保证
    pub fn do_unmap(&mut self, start: usize, len: usize) {
        //warn!("[MemroySet::do_unmap] not fully implemented!");
        let overlap_areas = self.wipe_overlap(start, len);
        // 删除overlap_areas在页表中的映射和释放对应的物理页帧
        // Todo: 未检查用户是否有权限删除
        self.remove_areas(overlap_areas);
        // 一定要刷表
        self.activate();
    }
    /// especially used for sys_mprotect
    /// change the protection on **pages**, 不修改`MapArea.map_perm`的权限
    /// `MapArea.map_perm`应该是用户对于这个区域的最大权限
    pub fn do_mprotect(&mut self, addr: usize, len: usize, perm: MapPermission) -> SyscallRet {
        let end = addr + len;
        let vpn_range = VPNRange::new(VirtAddr::from(addr).floor(), VirtAddr::from(end).ceil());
        let mut found;
        for vpn in vpn_range {
            // 找到对应的MapArea
            // todo: 优化, **slow**, 对于vpn_range应该在同一个或相邻的`MapArea`
            found = false;
            for area in self.areas.iter().rev() {
                if area.vpn_range.contains(vpn) {
                    // check permission, perm can only be a **subset** of area.map_perm
                    // if !area.map_perm.contains(perm) {
                    //     debug!("[do_mprotect] EACCES");
                    //     return Err(SyscallErr::EACCES.into());
                    // }
                    // remap
                    let pte_flags = PTEFlags::from_bits(perm.bits).unwrap();
                    self.page_table.update_flags(vpn, pte_flags);
                    found = true;
                    break;
                }
            }
            if !found {
                return Err(SyscallErr::EFAULT.into());
            }
        }
        Ok(0)
    }
    /// map sigreturn trampoline
    pub fn map_trampoline() {
        // let sigretrun_trampoline: [u8; 8] =
    }
    /// Without kernel stacks.
    pub fn new_kernel() -> Self {
        let mut memory_set = Self::new_bare();
        // map kernel sections
        info!(".text [{:#x}, {:#x})", stext as usize, etext as usize);
        info!(".rodata [{:#x}, {:#x})", srodata as usize, erodata as usize);
        info!(".data [{:#x}, {:#x})", sdata as usize, edata as usize);
        info!(
            ".bss [{:#x}, {:#x})",
            sbss_with_stack as usize, ebss as usize
        );
        info!("mapping .text section");
        memory_set.push(
            MapArea::new(
                (stext as usize).into(),
                (etext as usize).into(),
                MapType::Linear,
                MapPermission::R | MapPermission::X,
                // MapPermission::R | MapPermission::X | MapPermission::A | MapPermission::D,
            ),
            None,
            0,
        );
        // add U flag for sigreturn trampoline
        memory_set.page_table.update_flags(
            VirtAddr::from(sigreturn_trampoline as usize).floor(),
            PTEFlags::R | PTEFlags::X | PTEFlags::U,
        );
        info!("mapping .rodata section");
        memory_set.push(
            MapArea::new(
                (srodata as usize).into(),
                (erodata as usize).into(),
                MapType::Linear,
                MapPermission::R,
                // MapPermission::R | MapPermission::A | MapPermission::D,
            ),
            None,
            0,
        );
        info!("mapping .data section");
        memory_set.push(
            MapArea::new(
                (sdata as usize).into(),
                (edata as usize).into(),
                MapType::Linear,
                MapPermission::R | MapPermission::W,
                // MapPermission::R | MapPermission::W | MapPermission::A | MapPermission::D,
            ),
            None,
            0,
        );
        info!("mapping .bss section");
        memory_set.push(
            MapArea::new(
                (sbss_with_stack as usize).into(),
                (ebss as usize).into(),
                MapType::Linear,
                MapPermission::R | MapPermission::W,
                // MapPermission::R | MapPermission::W | MapPermission::A | MapPermission::D,
            ),
            None,
            0,
        );
        info!("mapping physical memory");
        memory_set.push(
            MapArea::new(
                (ekernel as usize).into(),
                MEMORY_END.into(),
                MapType::Linear,
                MapPermission::R | MapPermission::W,
                // MapPermission::R | MapPermission::W | MapPermission::A | MapPermission::D,
            ),
            None,
            0,
        );
        info!("mapping memory-mapped registers");
        for pair in MMIO {
            memory_set.push(
                MapArea::new(
                    ((*pair).0 + KERNEL_BASE).into(),
                    ((*pair).0 + (*pair).1 + KERNEL_BASE).into(),
                    MapType::Linear,
                    MapPermission::R | MapPermission::W,
                    // MapPermission::R | MapPermission::W | MapPermission::A | MapPermission::D,
                ),
                None,
                0,
            );
        }
        #[cfg(feature = "ext4-ramfs")]
        {
            info!("mapping ramfs");
            memory_set.push(
                MapArea::new(
                    VF2_RAMFS_BASE.into(),
                    (VF2_RAMFS_BASE + VF2_RAMFS_SIZE).into(),
                    MapType::Linear,
                    MapPermission::R | MapPermission::W,
                ),
                None,
                0,
            );
        }
        memory_set
    }
    /// Include sections in elf and user stack,
    /// returns (memory_set, user_sp, entry_point, aux_vec).
    pub fn from_elf(elf_data: &[u8]) -> (Self, usize, usize, Vec<AuxHeader>) {
        let mut memory_set = Self::new_from_global();

        // map program headers of elf, with U flag
        let elf = xmas_elf::ElfFile::new(elf_data).unwrap();
        let elf_header = elf.header;
        let magic = elf_header.pt1.magic;
        assert_eq!(magic, [0x7f, 0x45, 0x4c, 0x46], "invalid elf!");

        let ph_count = elf_header.pt2.ph_count();
        let mut entry_point = elf_header.pt2.entry_point() as usize;
        let mut aux_vec: Vec<AuxHeader> = Vec::with_capacity(64);

        aux_vec.push(AuxHeader {
            aux_type: AT_PHENT,
            value: elf.header.pt2.ph_entry_size() as usize,
        }); // ELF64 header 64bytes
        aux_vec.push(AuxHeader {
            aux_type: AT_PHNUM,
            value: ph_count as usize,
        });
        aux_vec.push(AuxHeader {
            aux_type: AT_PAGESZ,
            value: PAGE_SIZE,
        });

        if let Some(interp_entry_point) = memory_set.load_dl_interp_if_needed(&elf) {
            aux_vec.push(AuxHeader {
                aux_type: AT_BASE,
                value: DL_INTERP_OFFSET,
            });
            entry_point = interp_entry_point;
        } else {
            aux_vec.push(AuxHeader {
                aux_type: AT_BASE,
                value: 0,
            });
        }

        aux_vec.push(AuxHeader {
            aux_type: AT_FLAGS,
            value: 0 as usize,
        });
        aux_vec.push(AuxHeader {
            aux_type: AT_ENTRY,
            value: elf.header.pt2.entry_point() as usize,
        });
        aux_vec.push(AuxHeader {
            aux_type: AT_UID,
            value: 0 as usize,
        });
        aux_vec.push(AuxHeader {
            aux_type: AT_EUID,
            value: 0 as usize,
        });
        aux_vec.push(AuxHeader {
            aux_type: AT_GID,
            value: 0 as usize,
        });
        aux_vec.push(AuxHeader {
            aux_type: AT_EGID,
            value: 0 as usize,
        });
        aux_vec.push(AuxHeader {
            aux_type: AT_PLATFORM,
            value: 0 as usize,
        });
        aux_vec.push(AuxHeader {
            aux_type: AT_HWCAP,
            value: 0 as usize,
        });
        aux_vec.push(AuxHeader {
            aux_type: AT_CLKTCK,
            value: 100 as usize,
        });
        aux_vec.push(AuxHeader {
            aux_type: AT_SECURE,
            value: 0 as usize,
        });
        aux_vec.push(AuxHeader {
            aux_type: AT_NOTELF,
            value: 0x112d as usize,
        });
        // map program headers
        /*================================================================================*/
        let mut header_va: Option<usize> = None; // used to build auxv
        let mut max_end_vpn = VirtPageNum(0);

        for i in 0..ph_count {
            let ph = elf.program_header(i).unwrap();
            if ph.get_type().unwrap() == Type::Load {
                let start_va: VirtAddr = (ph.virtual_addr() as usize).into();
                if header_va.is_none() {
                    header_va = Some(start_va.into());
                }
                let end_va: VirtAddr = ((ph.virtual_addr() + ph.mem_size()) as usize).into();

                let mut map_perm = MapPermission::U;
                let ph_flags = ph.flags();
                if ph_flags.is_read() {
                    map_perm |= MapPermission::R;
                }
                if ph_flags.is_write() {
                    map_perm |= MapPermission::W;
                }
                if ph_flags.is_execute() {
                    map_perm |= MapPermission::X;
                }

                let map_area = MapArea::new(start_va, end_va, MapType::Framed, map_perm);
                max_end_vpn = map_area.vpn_range.get_end();

                // BUGGY: map_offset is not considered. Elf section is NOT aligned to PAGE_SIZE
                let map_offset = start_va.0 - start_va.floor().0 * PAGE_SIZE;

                memory_set.push(
                    map_area,
                    Some(&elf.input[ph.offset() as usize..(ph.offset() + ph.file_size()) as usize]),
                    map_offset,
                );
            }
        }

        // ph_head_addr
        let ph_head_addr = header_va.unwrap() + elf.header.pt2.ph_offset() as usize;
        info!(
            "[MemorySet::from_elf] AT_PHDR ph_head_addr is {:#x} ",
            ph_head_addr
        );
        aux_vec.push(AuxHeader {
            aux_type: AT_PHDR,
            value: ph_head_addr,
        });

        // map user stack with U flags
        let max_end_va: VirtAddr = max_end_vpn.into();
        let mut user_stack_bottom: usize = max_end_va.into();
        // guard page
        user_stack_bottom += PAGE_SIZE;
        let user_stack_top = user_stack_bottom + USER_STACK_SIZE;
        info!(
            "[MemorySet::from_elf] user stack [{:#x}, {:#x})",
            user_stack_bottom, user_stack_top
        );
        memory_set.push(
            MapArea::new(
                user_stack_bottom.into(),
                user_stack_top.into(),
                MapType::Framed,
                MapPermission::R | MapPermission::W | MapPermission::U,
            ),
            None,
            0,
        );
        // map heap with U flags
        // add guard page
        let heap_bottom = user_stack_top + PAGE_SIZE;
        let heap_top = heap_bottom;
        memory_set.brk = heap_top;
        // info!("user space heap_top: {:#x}", heap_top);
        let mut heap_area = MapArea::new(
            heap_bottom.into(),
            heap_top.into(),
            MapType::Framed,
            MapPermission::R | MapPermission::W | MapPermission::U,
        );
        info!(
            "[MemorySet::from_elf] heap [{:#x}, {:#x})",
            heap_bottom, heap_top
        );
        heap_area.map(&mut memory_set.page_table);
        memory_set.heap = Some(heap_area);

        // temp: check memory set sanity
        // memory_set.page_table.dump_all();

        (memory_set, user_stack_top, entry_point, aux_vec)
    }
    pub fn from_existed_user_lazily(user_space: &MemorySet) -> MemorySet {
        let page_table = PageTable::from_existed_user(&user_space.page_table);
        let areas = user_space.areas.clone();
        let heap = user_space.heap.clone();
        let brk = user_space.brk;
        MemorySet {
            page_table,
            areas,
            heap,
            brk,
            // mmap_start: MMAP_MIN_ADDR,
            mmap_start: user_space.mmap_start,
        }
    }
    ///Clone a same `MemorySet`
    pub fn from_existed_user(user_space: &MemorySet) -> MemorySet {
        let mut memory_set = Self::new_from_global();
        // copy data sections/trap_context/user_stack
        for area in user_space.areas.iter() {
            let new_area = MapArea::from_another(area);
            memory_set.push(new_area, None, 0);
            // copy data from another space
            for vpn in area.vpn_range {
                let src_ppn = user_space.translate(vpn).unwrap().ppn();
                let dst_ppn = memory_set.translate(vpn).unwrap().ppn();
                dst_ppn
                    .get_bytes_array()
                    .copy_from_slice(src_ppn.get_bytes_array());
            }
        }
        // copy heap from another space
        let mut new_heap = MapArea::from_another(
            user_space
                .heap
                .as_ref()
                .expect("heap not allocated in from_existed_user"),
        );
        new_heap.map(&mut memory_set.page_table);
        for vpn in new_heap.vpn_range {
            let src_ppn = user_space.translate(vpn).unwrap().ppn();
            let dst_ppn = memory_set.translate(vpn).unwrap().ppn();
            dst_ppn
                .get_bytes_array()
                .copy_from_slice(src_ppn.get_bytes_array());
        }
        memory_set.heap = Some(new_heap);
        memory_set.brk = user_space.brk;

        memory_set
    }
    ///Refresh TLB with `sfence.vma`
    pub fn activate(&self) {
        // log::debug!("[MemorySet::activate] entered");
        let satp = self.page_table.token();
        // self.page_table.dump();
        // self.page_table.dump_all();
        // log::debug!("[MemorySet::activate] satp: {:#x}", satp);
        unsafe {
            satp::write(satp);
            // log::debug!("[MemorySet::activate] satp written");
            asm!("sfence.vma");
        }
        // log::debug!("[MemorySet::activate] exited");
    }
    ///Translate throuth pagetable
    pub fn translate(&self, vpn: VirtPageNum) -> Option<PageTableEntry> {
        self.page_table.translate(vpn)
    }
    ///Remove all `MapArea`, 注意还有heap
    pub fn recycle_data_pages(&mut self) {
        //*self = Self::new_bare();
        self.areas.clear();
        self.heap = None;
    }

    fn load_dl_interp_if_needed(&mut self, elf: &ElfFile) -> Option<usize> {
        trace!("[load_dl_interp_if_needed] enter");
        let elf_header = elf.header;
        let ph_count = elf_header.pt2.ph_count();

        let mut is_dynamic_link = false;

        // - 检查ELF文件是否为动态链接。
        for i in 0..ph_count {
            let ph = elf.program_header(i).unwrap();
            if ph.get_type().unwrap() == xmas_elf::program::Type::Interp {
                // Interp：表示解释器路径，通常是一个动态链接器的路径。
                is_dynamic_link = true;
                break;
            }
        }

        if is_dynamic_link {
            info!("[load_dl] encounter a dl elf");
            // - 查找并读取 .interp 节，获取动态链接器路径。
            let section = elf.find_section_by_name(".interp").unwrap();
            // 把对应动态链接加载器
            let mut interp = String::from_utf8(section.raw_data(&elf).to_vec()).unwrap();
            interp = interp.strip_suffix("\0").unwrap_or(&interp).to_string();

            info!("[load_dl] interp {}", interp);
            let mut interps: Vec<String> = vec![interp.clone()];
            info!("interp {}", interp);

            // - 处理特定动态链接器路径。
            if interp.eq("/lib/ld-musl-riscv64-sf.so.1") || interp.eq("/lib/ld-musl-riscv64.so.1") {
                interps.push("/libc.so".to_string());
                interps.push("/lib/libc.so".to_string());
            }

            // - 解析动态链接器路径，找到对应的inode。
            let mut interp_inode = None;
            for interp in interps {
                if let Some(inode) = resolve_path(AT_FDCWD, &interp, OpenFlags::RDONLY).ok() {
                    interp_inode = Some(inode);
                    break;
                }
            }
            let interp_inode = interp_inode.unwrap();

            // - 打开并读取动态链接器文件内容。
            let interp_osinode =
                OSInode::new(true, false, interp_inode).expect("failed to open interp");
            let interp_elf_data = block_on(interp_osinode.read_all());

            // - 将动态链接器的ELF文件映射到内存中。
            let interp_elf = ElfFile::new(&interp_elf_data).unwrap();

            self.map_elf(&interp_elf, DL_INTERP_OFFSET.into());

            // - 返回动态链接器的入口点地址。
            Some(interp_elf.header.pt2.entry_point() as usize + DL_INTERP_OFFSET)
        } else {
            debug!("[load_dl] encounter a static elf");
            None
        }
    }

    fn map_elf(&mut self, elf: &ElfFile, offset: VirtAddr) -> (VirtPageNum, VirtAddr) {
        // 获取ELF文件的头部信息和程序头的数量。
        let elf_header = elf.header;
        let ph_count = elf_header.pt2.ph_count();

        // 初始化一些变量，包括最大结束虚拟页号max_end_vpn，头部虚拟地址header_va，以及一个标志has_found_header_va。
        // 记录ELF文件的入口点
        let mut max_end_vpn = offset.floor();
        let mut header_va = 0;
        let mut has_found_header_va = false;
        info!("[map_elf]: entry point {:#x}", elf.header.pt2.entry_point());

        // 遍历所有的程序头，对于类型为Load的程序头，计算起始和结束虚拟地址，并根据权限标志设置映射权限。
        // 创建一个新的VmArea对象，并根据是否需要写权限和页面缓存的存在，决定是懒惰映射还是立即映射。
        // 更新最大结束虚拟页号max_end_vpn。
        for i in 0..ph_count {
            let ph = elf.program_header(i).unwrap();

            if ph.get_type().unwrap() == xmas_elf::program::Type::Load {
                let start_va: VirtAddr = (ph.virtual_addr() as usize + offset.0).into();
                let end_va: VirtAddr =
                    ((ph.virtual_addr() + ph.mem_size()) as usize + offset.0).into();

                if !has_found_header_va {
                    header_va = start_va.0;
                    has_found_header_va = true;
                }

                let ph_flags = ph.flags();
                let mut map_perm = MapPermission::U;
                if ph_flags.is_read() {
                    map_perm |= MapPermission::R;
                }
                if ph_flags.is_write() {
                    map_perm |= MapPermission::W;
                }
                if ph_flags.is_execute() {
                    map_perm |= MapPermission::X;
                }

                let vm_area = MapArea::new(start_va, end_va, MapType::Framed, map_perm);
                max_end_vpn = vm_area.vpn_range.get_end();

                let map_offset = start_va.0 - start_va.floor().0 * PAGE_SIZE;

                debug!(
                    "[map_elf] ph offset {:#x}, file size {:#x}, mem size {:#x}",
                    ph.offset(),
                    ph.file_size(),
                    ph.mem_size()
                );
                debug!("[dynamic_link_map_elf] map_offset is {:#x}", map_offset);
                self.areas.push(vm_area.clone());

                self.push(
                    vm_area,
                    Some(&elf.input[ph.offset() as usize..(ph.offset() + ph.file_size()) as usize]),
                    map_offset,
                );
            }
        }
        // 返回最大结束虚拟页号和头部虚拟地址。
        (max_end_vpn, header_va.into())
    }
}

// - 将动态链接器的ELF文件映射到内存中。
// let interp_file = interp_inode.open(interp_inode.clone()).ok().unwrap();
// let mut interp_elf_data = Vec::new();
// interp_file
//     .read_all_from_start(&mut interp_elf_data)
//     .ok()
//     .unwrap();
// let interp_elf = ElfFile::new(&interp_elf_data).unwrap();

pub fn resolve_path(dirfd: isize, path: &str, flags: OpenFlags) -> SysResult<Arc<dyn Inode>> {
    debug!(
        "resolve_path: dirfd: {}, path: {}, flags: {:?},",
        dirfd, path, flags
    );
    open_inode(dirfd, &path.to_string().into(), flags)
}

/// map area structure, controls a contiguous piece of virtual memory
#[derive(Clone)]
pub struct MapArea {
    pub vpn_range: VPNRange,
    // 数据页, 要共享
    pub data_frames: BTreeMap<VirtPageNum, Arc<FrameTracker>>,
    map_type: MapType,
    // 在map_one时使用, 在COW时不修改
    map_perm: MapPermission,
}

impl MapArea {
    /// Create a empty `MapArea` from va
    pub fn new(
        start_va: VirtAddr,
        end_va: VirtAddr,
        map_type: MapType,
        map_perm: MapPermission,
    ) -> Self {
        let start_vpn: VirtPageNum = start_va.floor();
        let end_vpn: VirtPageNum = end_va.ceil();
        Self {
            vpn_range: VPNRange::new(start_vpn, end_vpn),
            data_frames: BTreeMap::new(),
            map_type,
            map_perm,
        }
    }
    /// Create a empty `MapArea` from vpn
    pub fn from_vpn(
        start_vpn: VirtPageNum,
        end_vpn: VirtPageNum,
        map_type: MapType,
        map_perm: MapPermission,
    ) -> Self {
        Self {
            vpn_range: VPNRange::new(start_vpn, end_vpn),
            data_frames: BTreeMap::new(),
            map_type,
            map_perm,
        }
    }
    /// Create a `MapArea` from VPNRange
    pub fn from_vpn_range(vpn_range: VPNRange, map_type: MapType, map_perm: MapPermission) -> Self {
        Self {
            vpn_range,
            data_frames: BTreeMap::new(),
            map_type,
            map_perm,
        }
    }
    pub fn from_another(another: &MapArea) -> Self {
        Self {
            vpn_range: VPNRange::new(another.vpn_range.get_start(), another.vpn_range.get_end()),
            data_frames: BTreeMap::new(),
            map_type: another.map_type,
            map_perm: another.map_perm,
        }
    }
    /// especially used for heap
    pub fn shrink(&mut self, page_table: &mut PageTable, new_end: VirtPageNum) {
        let old_end = self.vpn_range.get_end();
        assert!(new_end < old_end);
        for vpn in VPNRange::new(new_end, old_end) {
            self.unmap_one(page_table, vpn);
        }
        self.vpn_range.update_end(new_end);
    }
    /// especially used for heap
    pub fn expand(&mut self, page_table: &mut PageTable, new_end: VirtPageNum) {
        let old_end = self.vpn_range.get_end();
        assert!(new_end > old_end);
        for vpn in VPNRange::new(old_end, new_end) {
            self.map_one(page_table, vpn);
        }
        self.vpn_range.update_end(new_end);
    }
    // 在页表中添加映射关系
    pub fn map_one(&mut self, page_table: &mut PageTable, vpn: VirtPageNum) {
        let ppn: PhysPageNum;
        match self.map_type {
            MapType::Linear => {
                ppn = PhysPageNum(vpn.0 - 0x4000000);
            }
            MapType::Framed => {
                let frame = frame_alloc().unwrap();
                ppn = frame.ppn;
                self.data_frames.insert(vpn, Arc::new(frame));
            }
            MapType::Anonymous => {
                // map Anonymous area to physical address 0
                ppn = PhysPageNum::from(0)
            }
        }
        let pte_flags = PTEFlags::from_bits(self.map_perm.bits).unwrap();
        page_table.map(vpn, ppn, pte_flags);
    }
    pub fn unmap_one(&mut self, page_table: &mut PageTable, vpn: VirtPageNum) {
        if self.map_type == MapType::Framed {
            self.data_frames.remove(&vpn);
        }
        page_table.unmap(vpn);
    }
    pub fn map(&mut self, page_table: &mut PageTable) {
        for vpn in self.vpn_range {
            // if vpn.0 & 0x4000000 == 0 {
            //     trace!("[MapArea::map] mapping user space {:?}", vpn);
            // }
            self.map_one(page_table, vpn);
        }
    }
    pub fn unmap(&mut self, page_table: &mut PageTable) {
        for vpn in self.vpn_range {
            self.unmap_one(page_table, vpn);
        }
    }
    /// data: with offset and maybe with shorter length, quite flexible
    /// assume that all frames were cleared before
    pub fn copy_data(&mut self, page_table: &mut PageTable, data: &[u8], offset: usize) {
        assert_eq!(self.map_type, MapType::Framed);
        let mut start: usize = 0;
        let mut current_vpn = self.vpn_range.get_start();
        let len = data.len();
        // copy the first page with offset
        if offset != 0 {
            let src = &data[0..len.min(0 + PAGE_SIZE - offset)];
            let dst = &mut page_table
                .translate(current_vpn)
                .unwrap()
                .ppn()
                .get_bytes_array()[offset..offset + src.len()];
            dst.copy_from_slice(src);
            start += PAGE_SIZE - offset;
            current_vpn.step();
        }
        // copy the rest pages
        loop {
            if start >= len {
                break;
            }
            let src = &data[start..len.min(start + PAGE_SIZE)];
            let dst = &mut page_table
                .translate(current_vpn)
                .unwrap()
                .ppn()
                .get_bytes_array()[..src.len()];
            dst.copy_from_slice(src);
            start += PAGE_SIZE;
            current_vpn.step();
        }
    }
}

#[derive(Copy, Clone, PartialEq, Debug)]
/// map type for memory set: identical or framed
pub enum MapType {
    Linear,
    Framed,
    Anonymous,
}

bitflags! {
    /// map permission corresponding to that in pte: `R W X U`
    pub struct MapPermission: u16 {
        ///Readable
        const R = 1 << 1;
        ///Writable
        const W = 1 << 2;
        ///Excutable
        const X = 1 << 3;
        ///Accessible in U mode
        const U = 1 << 4;
        ///Accessed
        const A = 1 << 6;
        ///Dirty
        const D = 1 << 7;
    }
}

#[allow(unused)]
///Check PageTable running correctly
pub fn remap_test() {
    //let mut kernel_space = KERNEL_SPACE.exclusive_access();
    let kernel_space = KERNEL_SPACE.lock();
    let mid_text: VirtAddr = (stext as usize + (etext as usize - stext as usize) / 2).into();
    let mid_rodata: VirtAddr =
        (srodata as usize + (erodata as usize - srodata as usize) / 2).into();
    let mid_data: VirtAddr = (sdata as usize + (edata as usize - sdata as usize) / 2).into();
    assert!(!kernel_space
        .page_table
        .translate(mid_text.floor())
        .unwrap()
        .writable(),);
    assert!(!kernel_space
        .page_table
        .translate(mid_rodata.floor())
        .unwrap()
        .writable(),);
    assert!(!kernel_space
        .page_table
        .translate(mid_data.floor())
        .unwrap()
        .executable(),);
    println!("remap_test passed!");
}

#[allow(unused)]
/// Check PageTable from_global()running correctly
pub fn from_global_test() {
    let page_table = PageTable::from_global();
    let mid_text: VirtAddr = (stext as usize + (etext as usize - stext as usize) / 2).into();
    let mid_rodata: VirtAddr =
        (srodata as usize + (erodata as usize - srodata as usize) / 2).into();
    let mid_data: VirtAddr = (sdata as usize + (edata as usize - sdata as usize) / 2).into();
    assert!(!page_table.translate(mid_text.floor()).unwrap().writable(),);
    assert!(!page_table.translate(mid_rodata.floor()).unwrap().writable(),);
    assert!(!page_table.translate(mid_data.floor()).unwrap().executable(),);
    println!("from_global_test passed!");
}

#[allow(unused)]
///
pub fn dump_test() {
    let kernel_space = KERNEL_SPACE.lock();
    kernel_space.page_table.dump();
}
