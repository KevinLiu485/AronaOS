use crate::config::{SysResult, SyscallRet};
use crate::ctypes::{MMAPFLAGS, MMAPPROT};
use crate::fs::OSInode;
use crate::mm::{VirtAddr, VirtPageNum};
use crate::syscall::process;
use crate::task::current_task;
use crate::utils::SyscallErr;
use crate::PAGE_SIZE;
use core::any::Any;
use log::{debug, error, info};

// Todo?: 根据测例实际要实现的是sbrk?
// brk可以不对齐
pub fn sys_brk(brk: usize) -> SyscallRet {
    static mut unaligned_brk: usize = 0;
    info!("sys_brk argument: {:x}", brk);
    let current_task = current_task().expect("failt to get current task in sys_brk");
    let current_memory_set = &mut current_task.inner_lock().memory_set;
    let heap_area = current_memory_set
        .heap
        .as_mut()
        .expect("fail to get heap_area");
    let page_table = &mut current_memory_set.page_table;
    let start = heap_area.vpn_range.get_start();
    let end = heap_area.vpn_range.get_end();
    // sbrk(0)是获取当前program brk
    debug!("brk: {:x}", brk);
    if brk == 0 {
        // return Ok(VirtAddr::from(end).0);
        return Ok(unaligned_brk);
    }
    let new_end = VirtAddr::from(brk).ceil();
    if new_end < start {
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

pub fn sys_mmap(
    start: usize,
    len: usize,
    prot: usize,
    flags: usize,
    fd: i32,
    offset: usize,
) -> SyscallRet {
    let prot = MMAPPROT::from_bits(prot as u32).unwrap();
    let flags = MMAPFLAGS::from_bits(flags as u32).unwrap();
    let task = current_task().unwrap();

    let permission = prot.into();
    // 匿名映射
    if flags.contains(MMAPFLAGS::MAP_ANONYMOUS) {
        //需要fd为-1, offset为0
        if fd != -1 || offset != 0 {
            return Err(SyscallErr::EINVAL.into());
        }
        let vpn_range = task.inner_lock().memory_set.get_unmapped_area(start, len);
        task.inner_lock()
            .memory_set
            .insert_framed_area(vpn_range, permission);
    } else {
        // 文件映射
        // 需要offset为page aligned
        if offset % PAGE_SIZE != 0 {
            return Err(SyscallErr::EINVAL.into());
        }
        // 读取文件
        let file = task
            .inner_handler(|inner| inner.fd_table[fd as usize].clone())
            .unwrap();
    }
    error!("{} {} {:?} {:?} {} {}", start, len, prot, flags, fd, offset);
    todo!()
}
