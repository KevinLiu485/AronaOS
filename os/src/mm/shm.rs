use crate::config::{SyscallRet, PAGE_SIZE, PAGE_SIZE_BITS};
use crate::mm::{MapPermission, PTEFlags, VirtAddr};
use crate::mutex::SpinNoIrqLock;
use crate::task::processor::current_process;
use crate::task::RecycleAllocator;
use crate::utils::SyscallErr;
use alloc::collections::BTreeMap;
use alloc::sync::{Arc, Weak};
use alloc::vec::Vec;
use riscv::addr::Page;

// 共享内存管理器结构体
pub struct SharedMemoryManager {
    id_allocator: RecycleAllocator, // ID分配器
    // key -> id 的映射
    key_map: BTreeMap<usize, usize>,
    // id -> 共享内存 的映射
    shm_map: BTreeMap<usize, SharedMemory>,
}

impl SharedMemoryManager {
    // 创建一个新的共享内存管理器实例
    pub const fn new() -> Self {
        Self {
            id_allocator: RecycleAllocator::new(),
            key_map: BTreeMap::new(),
            shm_map: BTreeMap::new(),
        }
    }

    // 分配一个新的共享内存区域
    pub fn alloc(&mut self, key: usize, len: usize) -> usize {
        let id = self.id_allocator.id_alloc(); // 获取一个新的ID
        self.key_map.insert(key, id); // 将key映射到这个ID
        let page_cnt = len / PAGE_SIZE; // 计算需要的页数
        let shm = SharedMemory::new(page_cnt); // 创建一个新的共享内存实例
        self.shm_map.insert(id, shm); // 将ID映射到这个共享内存实例
        id // 返回分配的ID
    }

    /// 将虚拟内存区域附加到共享内存
    /// 返回该虚拟内存区域的起始地址
    pub fn attach(&mut self, shm_id: usize, addr: Option<VirtAddr>) -> SyscallRet {
        let shm = self.shm_map.get_mut(&shm_id).ok_or(SyscallErr::EINVAL)?; // 获取共享内存实例
        shm.attach(addr) // 附加虚拟内存区域
    }

    // 分离共享内存（未实现）
    #[allow(unused)]
    pub fn detach() {
        todo!()
    }
}

// 共享内存结构体
pub struct SharedMemory {
    pages: Vec<Weak<Page>>, // 页面的弱引用
    page_cnt: usize,        // 页面数量
}

impl SharedMemory {
    // 创建一个新的共享内存实例
    pub fn new(page_cnt: usize) -> Self {
        Self {
            page_cnt,
            pages: Vec::new(),
        }
    }

    /// 注意：此方法必须由当前线程调用
    pub fn attach(&mut self, addr: Option<VirtAddr>) -> SyscallRet {
        // current_process().inner_handler(|proc| {
        //     // 暂时给予用户所有权限
        //     let permission =
        //         MapPermission::R | MapPermission::X | MapPermission::W | MapPermission::U;
        //     let mut vma = match addr {
        //         Some(addr) => proc
        //             .memory_set
        //             .allocate_spec_area(
        //                 self.page_cnt << PAGE_SIZE_BITS,
        //                 permission,
        //                 addr,
        //                 VmAreaType::Shm,
        //             )?
        //             .ok_or(SyscallErr::ENOMEM)?,
        //         None => proc
        //             .memory_space
        //             .allocate_area(self.page_cnt << PAGE_SIZE_BITS, permission, VmAreaType::Shm)
        //             .ok_or(SyscallErr::ENOMEM)?,
        //     };
        //     debug_assert!(vma.end_vpn().0 - vma.start_vpn().0 == self.page_cnt);
        //     for (idx, vpn) in vma.vpn_range.into_iter().enumerate() {
        //         log::debug!(
        //             "[SharedMemory::attach] attach vma, vpn {:#x}, pte flags {:?}",
        //             vpn.0,
        //             PTEFlags::from(permission)
        //         );
        //         let page = match self.pages.len() <= idx {
        //             true => {
        //                 let page = Arc::new(PageBuilder::new().permission(permission).build());
        //                 self.pages.push(Arc::downgrade(&page));
        //                 page
        //             }
        //             false => match self.pages[idx].upgrade().as_ref() {
        //                 Some(page) => page.clone(),
        //                 None => {
        //                     let page = Arc::new(PageBuilder::new().permission(permission).build());
        //                     self.pages[idx] = Arc::downgrade(&page);
        //                     page
        //                 }
        //             },
        //         };
        //         vma.map_one(vpn, Some(page));
        //     }
        //     log::info!(
        //         "[SharedMemory::attach] attach vma, start vpn {:#x}, pte flags {:?}",
        //         vma.start_vpn().0,
        //         PTEFlags::from(permission)
        //     );
        //     let start_vpn = vma.start_vpn();
        //     proc.memory_space.insert_area(vma);
        //     proc.memory_space.activate();
        //
        //     Ok(VirtAddr::from(start_vpn).0)
        // })
        Ok(0)
    }
}

// 类型别名，简化代码
type Mutex<T> = SpinNoIrqLock<T>;

/// 全局共享内存管理器
pub static SHARED_MEMORY_MANAGER: Mutex<SharedMemoryManager> =
    Mutex::new(SharedMemoryManager::new());
