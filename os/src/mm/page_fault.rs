use crate::mm::address::VirtPageNum;
use crate::mm::frame_allocator::frame_alloc;
use crate::mm::page_table::{PTEFlags, PageTable, PageTableEntry};
use crate::mm::PhysPageNum;
// use crate::syscall::process;
use crate::task::processor::current_process;
// use crate::task::current_task;
// use crate::task::processor::current_process;
use crate::utils::SyscallErr;
use alloc::sync::Arc;
use log::error;

/// call this function only when scause.cause() == Exception::LoadPageFault || Exception::StorePageFault
/// 1. fork COW area
/// 2. lazy allocation
pub fn handle_recoverable_page_fault(
    page_table: &PageTable,
    vpn: VirtPageNum,
) -> Result<(), SyscallErr> {
    if let Some(pte) = page_table.find_pte(vpn) {
        if pte.is_cow() {
            // fork COW area
            // 如果refcnt == 1, 则直接修改pte, 否则, 分配新的frame, 修改pte, 更新MemorySet
            // debug!("handle cow page fault(cow), vpn {:#x}", vpn.0);
            let process = current_process();
            let memory_set = &mut process.inner_lock().memory_set;
            // debug!("get current task");
            let heap = memory_set.heap.as_mut().unwrap();
            // rev是因为一般来说, COW区域都是后续创建的(如mmap)
            for area in memory_set.areas.iter_mut().rev() {
                if area.vpn_range.contains(vpn) {
                    // 根据VPN找到对应的data_frame, 并查看Arc的引用计数
                    let data_frame = area.data_frames.get(&vpn).unwrap();
                    if Arc::strong_count(data_frame) == 1 {
                        // 直接修改pte
                        // clear COW bit and set valid bit
                        // debug!("ref_cnt = 1");
                        let mut flags = pte.flags();
                        flags.remove(PTEFlags::COW);
                        flags.insert(PTEFlags::W);
                        *pte = PageTableEntry::new(pte.ppn(), flags);
                        return Ok(());
                    } else {
                        // 分配新的frame, 修改pte, 更新MemorySet
                        let frame = frame_alloc().unwrap();
                        let src_frame = pte.ppn().get_bytes_array();
                        let dst_frame = frame.ppn.get_bytes_array();
                        dst_frame.copy_from_slice(src_frame);
                        // clear COW bit and set valid bit, update pte
                        let mut flags = pte.flags();
                        flags.remove(PTEFlags::COW);
                        flags.insert(PTEFlags::W);
                        *pte = PageTableEntry::new(frame.ppn, flags);
                        // update MemorySet -> MapArea -> data_frames
                        area.data_frames.insert(vpn, Arc::new(frame));
                        return Ok(());
                    }
                    // todo?: flush TLB
                    /*
                    unsafe {
                        asm!(
                            "sfence.vma x0, x0",
                            options(nomem, nostack, preserves_flags)
                        );
                    }
                    */
                }
            }
            // 如果没有找到对应的MapArea, 则说明是堆区域的COW
            if heap.vpn_range.contains(vpn) {
                let data_frame = heap.data_frames.get(&vpn).unwrap();
                if Arc::strong_count(data_frame) == 1 {
                    // 直接修改pte
                    // clear COW bit and set valid bit
                    // debug!("ref_cnt = 1");
                    let mut flags = pte.flags();
                    flags.remove(PTEFlags::COW);
                    flags.insert(PTEFlags::W);
                    *pte = PageTableEntry::new(pte.ppn(), flags);
                    return Ok(());
                } else {
                    // 分配新的frame, 修改pte, 更新MemorySet
                    let frame = frame_alloc().unwrap();
                    let src_frame = pte.ppn().get_bytes_array();
                    let dst_frame = frame.ppn.get_bytes_array();
                    dst_frame.copy_from_slice(src_frame);
                    // clear COW bit and set valid bit, update pte
                    let mut flags = pte.flags();
                    flags.remove(PTEFlags::COW);
                    flags.insert(PTEFlags::W);
                    *pte = PageTableEntry::new(frame.ppn, flags);
                    // update MemorySet -> MapArea -> data_frames
                    heap.data_frames.insert(vpn, Arc::new(frame));
                    return Ok(());
                }
            }
            error!("cow page fault recover failed");
            return Err(SyscallErr::EFAULT);
        } else {
            // lazy allocation
            if pte.ppn() == PhysPageNum::from(0) {
                //info!("handle mmap anonamous areas");
                let process = current_process();
                let memory_set = &mut process.inner_lock().memory_set;
                // 分配物理页帧, 更新页表, 管理MapArea::data_frames
                for area in memory_set.areas.iter_mut().rev() {
                    if area.vpn_range.contains(vpn) {
                        let frame = frame_alloc().unwrap();
                        let ppn = frame.ppn;
                        *pte = PageTableEntry::new(ppn, pte.flags());
                        area.data_frames.insert(vpn, Arc::new(frame));
                        return Ok(());
                    }
                }
            }
            error!("lazy allocation fault recover failed");
            return Err(SyscallErr::EFAULT);
        }
    } else {
        error!("page fault but can't find valid pte");
        return Err(SyscallErr::EFAULT);
    }
}
