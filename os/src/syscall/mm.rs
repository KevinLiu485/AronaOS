use crate::mm::{shm::SharedMemoryManager, MapPermission, VirtAddr};
use crate::{config::SyscallRet, utils::SyscallErr};

use crate::config::{MMAP_MIN_ADDR, PAGE_SIZE};
use crate::ctypes::{MmapFlags, MMAPPROT};
use crate::mutex::SpinNoIrqLock;
use crate::task::processor::current_process;
use log::{info, trace};

// Todo?: 根据测例实际要实现的是sbrk?
// brk可以不对齐
pub fn sys_brk(brk: usize) -> SyscallRet {
    // static mut unaligned_brk: usize = 0;
    trace!("[sys_brk] enter. brk: {:#x}", brk);
    let process = current_process();
    let current_memory_set = &mut process.inner_lock().memory_set;
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
    // debug!("brk: {:#x}", brk);
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

/// Todo: 支持MAP_FIXED
pub async fn sys_mmap(
    start: usize,
    len: usize,
    prot: usize,
    flags: usize,
    fd: i32,
    offset: usize,
) -> SyscallRet {
    trace!("[sys_mmap] enter");

    //处理参数
    let prot = MMAPPROT::from_bits(prot as u32).ok_or(SyscallErr::EINVAL)?;
    let flags = MmapFlags::from_bits(flags as u32).ok_or(SyscallErr::EINVAL)?;
    let proc = current_process();
    trace!(
        "[sys_mmap] start: {:#x}, len: {:#x}, fd: {}, offset: {:#x}, flags: {:?}, prot: {:?}",
        start,
        len,
        fd,
        offset,
        flags,
        prot,
    );
    if len == 0 {
        return Err(SyscallErr::EINVAL.into());
    }
    if flags.contains(MmapFlags::MAP_FIXED) {
        unimplemented!("[sys_mmap] MAP_FIXED")
    }
    // mmap区域最低地址为MMAP_MIN_ADDR
    let mut start = proc.inner_handler(|inner| inner.memory_set.mmap_start);
    let mut permission = prot.into();
    // 注意加上U权限
    permission |= MapPermission::U;
    // 匿名映射
    if flags.contains(MmapFlags::MAP_ANONYMOUS) {
        log::info!("[sys_mmap] anonymous mmap");
        //需要fd为-1, offset为0
        if fd != -1 || offset != 0 {
            return Err(SyscallErr::EINVAL.into());
        }
        let vpn_range = proc
            .inner_lock()
            .memory_set
            .get_unmapped_area(start, len)
            .ok_or(SyscallErr::ENOMEM)?;
        log::debug!("[sys_mmap] vpn_range: {}", vpn_range);
        proc.inner_lock()
            .memory_set
            .insert_framed_area(vpn_range, permission);
        // .insert_anonymous_area(vpn_range, permission);

        let new_start: usize = VirtAddr::from(vpn_range.get_end()).into();
        proc.inner_handler(|inner| inner.memory_set.mmap_start = new_start);
        start = VirtAddr::from(vpn_range.get_start()).into();

        return Ok(start);
    } else {
        log::info!("[sys_mmap] file mmap");
        // 文件映射
        // 需要offset为page aligned
        if offset % PAGE_SIZE != 0 {
            return Err(SyscallErr::EINVAL.into());
        }
        // 读取文件
        let file = proc
            .inner_handler(|inner| inner.fd_table.get(fd as usize))
            .unwrap()
            .file;
        let vpn_range = proc
            .inner_lock()
            .memory_set
            .get_unmapped_area(start, len)
            .ok_or(SyscallErr::ENOMEM)?;
        proc.inner_lock()
            .memory_set
            .insert_framed_area(vpn_range, permission);

        let new_start: usize = VirtAddr::from(vpn_range.get_end()).into();
        proc.inner_handler(|inner| inner.memory_set.mmap_start = new_start);
        start = VirtAddr::from(vpn_range.get_start()).into();
        let buf = unsafe { core::slice::from_raw_parts_mut(start as *mut u8, len) };
        let origin_offset = file.seek(offset);
        if file.read(buf).await.is_err() {
            return Err(SyscallErr::EINVAL.into());
        }
        if let Some(origin_offset) = origin_offset {
            // file is seekable, then seek back
            file.seek(origin_offset);
        }
        return Ok(start);
    }
}

pub fn sys_munmap(start: usize, len: usize) -> SyscallRet {
    info!("[sys_munmap] start: 0x{:x}, len: 0x{:x}", start, len);
    // start必须页对齐, 且要大于等于MMAP_MIN_ADDR
    if start % PAGE_SIZE != 0 || len == 0 || start < MMAP_MIN_ADDR {
        return Err(SyscallErr::EINVAL.into());
    }
    current_process().inner_handler(|inner| inner.memory_set.do_unmap(start, len));
    Ok(0)
}

pub fn sys_mprotect(addr: usize, len: usize, prot: usize) -> SyscallRet {
    let prot = MMAPPROT::from_bits(prot as u32).ok_or(SyscallErr::EINVAL)?;
    let perm: MapPermission = prot.into();
    trace!(
        "[sys_mprotect] addr: 0x{:x}, len: 0x{:x}, prot: {:?}",
        addr,
        len,
        prot
    );
    if addr % PAGE_SIZE != 0 || len == 0 {
        return Err(SyscallErr::EINVAL.into());
    }
    // 先要检查是否有权限
    // 1. 检查是否有对应的MapArea
    // 2. 检查是否有对应的权限, 不能增加权限

    // 不修改MapArea的权限，只修改页表中的权限
    current_process().inner_handler(|inner| inner.memory_set.do_mprotect(addr, len, perm))
}

/// fake implementation
#[allow(unused)]
pub fn sys_madvise(addr: usize, len: usize, advise: i32) -> SyscallRet {
    return Ok(0);
}

const IPC_PRIVATE: usize = 0; // 这里定义了一个常量 IPC_PRIVATE，其值为 0。这个常量通常用于表示私有共享内存键。
pub fn sys_shmget(
    key: usize,    // 用于标识共享内存段。
    len: usize,    // 共享内存段的长度。
    _shmflag: u32, // 共享内存段的标志。（未使用）
) -> SyscallRet {
    trace!("[sys_shmget] start to sync...");

    if key != IPC_PRIVATE {
        panic!("[sys_shmget] unsupported operation, key {:#X}", key);
    }

    trace!("[sys_shmget] finish");
    Ok(SHARED_MEMORY_MANAGER.lock().alloc(key, len))
}

pub static SHARED_MEMORY_MANAGER: SpinNoIrqLock<SharedMemoryManager> =
    SpinNoIrqLock::new(SharedMemoryManager::new());
