extern crate alloc;

use crate::{
    timer::{current_time, TimeSpec},
    utils::SyscallErr,
    SyscallRet,
};
use core::time::Duration;
use log::error;

use flags::*;
use futex::{futex_requeue, futex_wait, futex_wake, futex_wake_bitset};

/*
use axprocess::{
    current_process, current_task, futex::FutexRobustList
}
;

use crate::{RobustList, SyscallError, SyscallResult, TimeSecs};
*/

pub mod flags;
pub mod futex;
mod jhash;
mod queue;

pub async fn sys_futex(
    uaddr: usize,
    futex_op: i32,
    val: u32,
    val2: usize,
    uaddr2: usize,
    val3: u32,
) -> SyscallRet {
    // convert `TimeSecs` struct to `timeout` nanoseconds
    let timeout = if val2 != 0 {
        let time_sepc: TimeSpec = unsafe { *(val2 as *const TimeSpec) };
        time_sepc.turn_to_nanos()
    } else {
        // usize::MAX
        0
    };

    let flags: i32 = futex_op_to_flag(futex_op);
    // cmd determines the operation of futex
    let cmd: i32 = futex_op & FUTEX_CMD_MASK;
    // TODO: shared futex and real time clock
    // It's Ok for ananonymous mmap to use private futex
    if (flags & FLAGS_SHARED) != 0 {
        log::info!(
            "[sys_futex] shared futex is not supported, but it's ok for anonymous mmap to use private futex"
        );
    }
    if (flags & FLAGS_CLOCKRT) != 0 {
        panic!("FUTEX_CLOCK_REALTIME is not supported");
    }

    match cmd {
        FUTEX_WAIT => {
            let val3 = FUTEX_BITSET_MATCH_ANY;
            // convert relative timeout to absolute timeout
            let deadline: Option<Duration> = if timeout != 0 {
                Some(Duration::from_nanos(timeout as u64) + current_time())
            } else {
                None
            };
            futex_wait(uaddr.into(), flags, val, deadline, val3).await
        }
        FUTEX_WAIT_BITSET => {
            let deadline: Option<Duration> = if timeout != 0 {
                Some(Duration::from_nanos(timeout as u64))
            } else {
                None
            };
            futex_wait(uaddr.into(), flags, val, deadline, val3).await
        }
        FUTEX_WAKE => futex_wake(uaddr.into(), flags, val).await,
        FUTEX_WAKE_BITSET => futex_wake_bitset(uaddr.into(), flags, val, val3).await,
        FUTEX_REQUEUE => futex_requeue(uaddr.into(), flags, val, uaddr2.into(), val2 as u32).await,
        FUTEX_CMP_REQUEUE => {
            error!("[linux_syscall_api] futex: unsupported futex operation: FUTEX_CMP_REQUEUE");
            return Err(SyscallErr::ENOSYS.into());
        }
        FUTEX_WAKE_OP => {
            // futex_wake(uaddr, flags, uaddr2, val, val2, val3)
            error!("[linux_syscall_api] futex: unsupported futex operation: FUTEX_WAKE_OP");
            return Err(SyscallErr::ENOSYS.into());
        }
        // TODO: priority-inheritance futex
        _ => {
            error!(
                "[linux_syscall_api] futex: unsupported futex operation: {}",
                cmd
            );
            return Err(SyscallErr::ENOSYS.into());
        }
    }
    // success anyway and reach here
}

/*
/// 内核只发挥存储的作用
/// 但要保证head对应的地址已经被分配
/// # Arguments
/// * head: usize
/// * len: usize
pub fn syscall_set_robust_list(args: [usize; 6]) -> SyscallResult {
    let head = args[0];
    let len = args[1];
    let process = current_process();
    if len != core::mem::size_of::<RobustList>() {
        return Err(SyscallError::EINVAL);
    }
    let curr_id = current_task().id().as_u64();
    if process.manual_alloc_for_lazy(head.into()).is_ok() {
        let mut robust_list = process.robust_list.lock();
        robust_list.insert(curr_id, FutexRobustList::new(head, len));
        Ok(0)
    } else {
        Err(SyscallError::EINVAL)
    }
}

/// 取出对应线程的robust list
/// # Arguments
/// * pid: i32
/// * head: *mut usize
/// * len: *mut usize
pub fn syscall_get_robust_list(args: [usize; 6]) -> SyscallResult {
    let pid = args[0] as i32;
    let head = args[1] as *mut usize;
    let len = args[2] as *mut usize;

    if pid == 0 {
        let process = current_process();
        let curr_id = current_task().id().as_u64();
        if process
            .manual_alloc_for_lazy((head as usize).into())
            .is_ok()
        {
            let robust_list = process.robust_list.lock();
            if robust_list.contains_key(&curr_id) {
                let list = robust_list.get(&curr_id).unwrap();
                unsafe {
                    *head = list.head;
                    *len = list.len;
                }
            } else {
                return Err(SyscallError::EPERM);
            }
            return Ok(0);
        }
        return Err(SyscallError::EPERM);
    }
    Err(SyscallError::EPERM)
}
    */
