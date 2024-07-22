//! 实现与futex相关的系统调用
/*
use axhal::mem::VirtAddr;
use axlog::info;
use core::time::Duration;
use crate::{current_process, current_thread_uncheck, signal::current_have_signals, yield_now_task};
use axfutex::{flags::FLAGS_SHARED, futex::{FutexKey, FutexQ}, queues::{futex_hash, FUTEXQUEUES}};
*/

extern crate alloc;

use core::time::Duration;

use super::{flags::*, queue::FUTEXQUEUES};
use crate::{
    futex::queue::futex_hash,
    task::{
        processor::{current_process, current_thread_uncheck},
        task::{current_have_signals, TaskRef},
        yield_task,
    },
    timer::current_time,
    utils::SyscallErr,
    SyscallRet, PAGE_SIZE_BITS,
};
use log::info;

use crate::mm::VirtAddr;
/// Kernel futex
pub struct FutexQ {
    /// The `val` of the futex
    /// the task in the queue waiting for the same futex may have different `val`
    pub key: FutexKey,
    /// the task which is waiting for the futex
    pub task: TaskRef,
    /// the bitset of the futex
    pub bitset: u32,
}

impl FutexQ {
    /// Create a new futex queue
    pub fn new(key: FutexKey, task: TaskRef, bitset: u32) -> Self {
        Self { key, task, bitset }
    }
    /// check if the futex queues matches the key
    pub fn match_key(&self, key: &FutexKey) -> bool {
        self.key == *key
    }
}

/// Futexes are matched on equal values of this key.
///
/// The key type depends on whether it's a shared or private mapping.
/// use pid to replace the mm_struct pointer
/// **only support private futex now**
#[derive(Copy, Clone, Default, Ord, PartialOrd, Eq, PartialEq, Debug)]
pub struct FutexKey {
    /// use pid to replace the mm_struct pointer to distinguish different processes
    /// only support private futex now
    pub pid: u32,
    // aligned to page size addr
    pub(crate) aligned: u32,
    // offset in page
    pub(crate) offset: u32,
}

impl FutexKey {
    pub fn new(pid: u64, aligned: usize, offset: u32) -> Self {
        Self {
            pid: pid as u32,
            aligned: aligned as u32,
            offset,
        }
    }
}

#[derive(Default)]
/// 用于存储 robust list 的结构
pub struct FutexRobustList {
    /// The location of the head of the robust list in user space
    pub head: usize,
    /// The length of the robust list
    pub len: usize,
}

impl FutexRobustList {
    /// Create a new robust list
    pub fn new(head: usize, len: usize) -> Self {
        Self { head, len }
    }
}

pub fn futex_get_value_locked(vaddr: VirtAddr) -> SyscallRet {
    let uaddr: usize = vaddr.into();
    let real_futex_val: u32 = unsafe { (uaddr as *const u32).read_volatile() };
    Ok(real_futex_val as usize)
}

pub fn get_futex_key(uaddr: VirtAddr, flags: i32) -> FutexKey {
    if flags & FLAGS_SHARED != 0 {
        /* Todo: after implement inode layer
        let inode = uaddr.get_inode();
        let page_index = uaddr.get_page_index();
        let offset = uaddr.get_offset();
        FutexKey::new(inode, page_index, offset)
        */
        let pid = current_process().getpid();
        let uaddr_u64: usize = uaddr.into();
        let aligned = uaddr_u64 & !((1 << PAGE_SIZE_BITS) - 1);
        let offset = (uaddr_u64 & ((1 << PAGE_SIZE_BITS) - 1)) as u32;
        return FutexKey::new(pid as u64, aligned, offset);
    } else {
        let pid = current_process().getpid();
        // let aligned = uaddr.align_down_4k().as_usize();
        // let offset = uaddr.align_offset_4k() as u32;
        let uaddr_u64: usize = uaddr.into();
        let aligned = uaddr_u64 & !((1 << PAGE_SIZE_BITS) - 1);
        let offset = (uaddr_u64 & ((1 << PAGE_SIZE_BITS) - 1)) as u32;
        return FutexKey::new(pid as u64, aligned, offset);
    }
}

pub async fn futex_wait(
    vaddr: VirtAddr,
    flags: i32,
    expected_val: u32,
    deadline: Option<Duration>,
    bitset: u32,
) -> SyscallRet {
    info!(
        "[futex_wait] current task: {:?}, vaddr: {:?}, flags: {:?}, val: {:?}, deadline: {:?}",
        current_thread_uncheck().getpid(),
        vaddr,
        flags,
        expected_val,
        deadline
    );
    let mut is_timeout = false;

    // we may be victim of spurious wakeups, so we need to loop
    loop {
        let key = get_futex_key(vaddr, flags);
        let real_futex_val = futex_get_value_locked(vaddr)?;
        if expected_val != real_futex_val as u32 {
            return Err(SyscallErr::EAGAIN.into());
        }
        // 比较后相等，放入等待队列
        {
            let mut hash_bucket = FUTEXQUEUES.buckets[futex_hash(&key)].lock();
            let cur_futexq = FutexQ::new(key, current_thread_uncheck().clone(), bitset);
            hash_bucket.push_back(cur_futexq);

            // drop lock to avoid deadlock
            drop(hash_bucket);
        }
        if let Some(deadline) = deadline {
            let now = current_time();
            is_timeout = deadline < now;
        }
        if deadline.is_none() || !is_timeout {
            yield_task().await;
        }

        // If we were woken (and unqueued), we succeeded, whatever.
        // We doesn't care about the reason of wakeup if we were unqueued.
        let mut hash_bucket = FUTEXQUEUES.buckets[futex_hash(&key)].lock();
        let cur_id = current_thread_uncheck().getpid();
        //if let Some(idx) = hash_bucket.iter().position(|futex_q| futex_q.task.id().as_u64() == cur_id) {
        if let Some(idx) = hash_bucket
            .iter()
            .position(|futex_q| futex_q.task.getpid() == cur_id)
        {
            hash_bucket.remove(idx);
            if is_timeout {
                return Err(SyscallErr::ETIMEDOUT.into());
            }
            if current_have_signals() {
                return Err(SyscallErr::EINTR.into());
            }
        } else {
            // the task is woken up anyway
            return Ok(0);
        }
    }
}

// no need to check the bitset, faster than futex_wake_bitset
pub async fn futex_wake(vaddr: VirtAddr, flags: i32, nr_waken: u32) -> SyscallRet {
    info!(
        "[futex_wake] vaddr: {:?}, flags: {:?}, nr_waken: {:?}",
        vaddr, flags, nr_waken
    );
    let mut ret = 0;
    let key = get_futex_key(vaddr, flags);
    {
        let mut hash_bucket = FUTEXQUEUES.buckets[futex_hash(&key)].lock();

        if hash_bucket.is_empty() {
            info!("hash_bucket is empty");
            return Ok(0);
        } else {
            hash_bucket.retain(|futex_q| {
                if ret < nr_waken && futex_q.key == key {
                    //let wake_up = WAIT_FOR_FUTEX.notify_task(&futex_q.task);
                    info!("wake up task {:?}", futex_q.task.getpid());
                    ret += 1;
                    return false;
                }
                true
            })
        }
        // drop hash_bucket to avoid deadlock
    }
    yield_task().await;
    info!("[futex_wake] wake up {:?} tasks", ret);
    Ok(ret as usize)
}

pub async fn futex_wake_bitset(
    vaddr: VirtAddr,
    flags: i32,
    nr_waken: u32,
    bitset: u32,
) -> SyscallRet {
    info!(
        "[futex_wake_bitset] vaddr: {:?}, flags: {:?}, nr_waken: {:?}, bitset: {:x}",
        vaddr, flags, nr_waken, bitset
    );
    if bitset == 0 {
        return Err(SyscallErr::EINVAL.into());
    }
    let mut ret = 0;
    let key = get_futex_key(vaddr, flags);
    {
        let mut hash_bucket = FUTEXQUEUES.buckets[futex_hash(&key)].lock();
        if hash_bucket.is_empty() {
            return Ok(0);
        } else {
            hash_bucket.retain(|futex_q| {
                if ret == nr_waken {
                    return true;
                }
                if (futex_q.bitset & bitset) != 0 && futex_q.key == key {
                    //WAIT_FOR_FUTEX.notify_task(&futex_q.task);
                    ret += 1;
                    return false;
                }
                return true;
            })
        }
        // drop hash_bucket to avoid deadlock
    }
    yield_task().await;
    Ok(ret as usize)
}

pub async fn futex_requeue(
    uaddr: VirtAddr,
    flags: i32,
    nr_waken: u32,
    uaddr2: VirtAddr,
    nr_requeue: u32,
) -> SyscallRet {
    let mut ret = 0;
    let mut requeued = 0;
    let key = get_futex_key(uaddr, flags);
    let req_key = get_futex_key(uaddr2, flags);

    if key == req_key {
        return futex_wake(uaddr, flags, nr_waken).await;
    }

    {
        let mut hash_bucket = FUTEXQUEUES.buckets[futex_hash(&key)].lock();
        if hash_bucket.is_empty() {
            return Ok(0);
        } else {
            while let Some(futex_q) = hash_bucket.pop_front() {
                if futex_q.key == key {
                    //WAIT_FOR_FUTEX.notify_task(&futex_q.task);
                    ret += 1;
                    if ret == nr_waken {
                        break;
                    }
                }
            }
            if hash_bucket.is_empty() {
                return Ok(ret as usize);
            }
            // requeue the rest of the waiters
            let mut req_bucket = FUTEXQUEUES.buckets[futex_hash(&req_key)].lock();
            while let Some(futex_q) = hash_bucket.pop_front() {
                req_bucket.push_back(futex_q);
                requeued += 1;
                if requeued == nr_requeue {
                    break;
                }
            }
        }
    }
    yield_task().await;
    Ok(ret as usize)
}
