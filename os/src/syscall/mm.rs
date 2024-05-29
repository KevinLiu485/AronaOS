use crate::config::SyscallRet;
use crate::mm::VirtAddr;

use crate::task::current_task;
use log::{debug, info};

// Todo?: 根据测例实际要实现的是sbrk?
// brk可以不对齐
pub fn sys_brk(brk: usize) -> SyscallRet {
    // static mut unaligned_brk: usize = 0;
    info!("sys_brk argument: {:x}", brk);
    let current_task = current_task().expect("failt to get current task in sys_brk");
    let current_memory_set = &mut current_task.inner_lock().memory_set;
    // sbrk(0)是获取当前program brk(堆顶)
    if brk == 0 {
        return Ok(current_memory_set.brk);
    }
    let heap_area = current_memory_set
        .heap
        .as_mut()
        .expect("fail to get heap_area");
    let page_table = &mut current_memory_set.page_table;
    let start = heap_area.vpn_range.get_start();
    let end = heap_area.vpn_range.get_end();
    current_memory_set.brk = brk;
    debug!("brk: {:x}", brk);
    let new_end = VirtAddr::from(brk).ceil();
    // 页内偏移, 不用分配新页
    if new_end == end {
        return Ok(0);
    } else if new_end < start {
        // Todo!: 设置errno为ENOMEM
        return Err(1);
    } else if new_end < end {
        // deallocate heap_area
        heap_area.shrink(page_table, new_end);
        return Ok(0);
        // Todo!: 粗略地设置了heap的size最大为10 page
    } else if new_end > end && new_end - start < 10 {
        // update heap_top
        heap_area.expand(page_table, new_end);
        return Ok(0);
    } else {
        // new_end太大
        // Todo!: 设置errno为ENOMEM
        return Err(1);
    }
}
