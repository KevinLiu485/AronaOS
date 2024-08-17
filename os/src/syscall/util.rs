use crate::mm::VirtAddr;
use crate::{
    ctypes::*,
    task::processor::current_process,
    timer::{get_time_ms, TimeSpec},
    utils::SyscallErr,
    SyscallRet,
};
use core::{mem::size_of, ptr};
use log::{error, trace, warn};

/// fake uname  
/// Todo?:
pub fn sys_uname(uts: usize) -> SyscallRet {
    trace!("[sys_uname] enter");
    let uts = uts as *mut Utsname;
    //Todo!: check validarity
    let utsname = Utsname::default();
    unsafe {
        ptr::write(uts, utsname);
    }
    Ok(0)
}

/// fake sys_times
/// Todo?:
// #[allow(unused)]
pub fn sys_times(buf: usize) -> SyscallRet {
    trace!("[sys_times] enter");
    warn!("[sys_times] not fully implemented");
    let buf = buf as *mut Tms;
    let tms = Tms::default();
    unsafe {
        ptr::write(buf, tms);
    }
    Ok(0)
}

/// Todo!: manage Sum register
pub fn sys_get_time(time_val_ptr: usize) -> SyscallRet {
    trace!("[sys_get_time] enter");
    let time_val_ptr = time_val_ptr as *mut TimeVal;
    let current_time_ms = get_time_ms();
    let time_val = TimeVal {
        sec: current_time_ms / 1000,
        usec: current_time_ms % 1000 * 1000,
    };
    // debug!("get time of day, time(ms): {}", current_time_ms);
    unsafe {
        time_val_ptr.write_volatile(time_val);
    }
    Ok(0)
}

pub const CLOCK_REALTIME: usize = 0;
#[allow(unused)]
pub const CLOCK_MONOTONIC: usize = 1;
#[allow(unused)]
pub const CLOCK_PROCESS_CPUTIME_ID: usize = 2;

pub fn sys_clock_gettime(clock_id: usize, tp: *mut TimeSpec) -> SyscallRet {
    trace!(
        "[sys_clock_gettime] enter. clock_id: {}, tp: {:#x}",
        clock_id,
        tp as usize
    );
    warn!("[sys_clock_gettime] not fully implemented");
    match clock_id {
        CLOCK_REALTIME | 1 => {
            let time_ms = get_time_ms();
            // debug!("[sys_clock_gettime] get_time_ms: {}", time_ms);
            let time_spec = TimeSpec {
                sec: time_ms / 1000,
                nsec: time_ms % 1000 * 1000000,
            };
            unsafe {
                ptr::write(tp, time_spec);
            }
            Ok(0)
        }
        // CLOCK_MONOTONIC => {}
        // CLOCK_PROCESS_CPUTIME_ID => {}
        _ => {
            error!("[sys_clock_gettime] clock_id {} not supported", clock_id);
            Err(SyscallErr::EINVAL as usize)
        }
    }
}

const _F_SIZE: usize = 20 - 2 * size_of::<u64>() - size_of::<u32>();

#[repr(C)]
pub struct Sysinfo {
    /// Seconds since boot
    pub uptime: i64,
    /// 1, 5, and 15 minute load averages
    pub loads: [u64; 3],
    /// Total usable main memory size
    pub totalram: u64,
    /// Available memory size
    pub freeram: u64,
    /// Amount of shared memory
    pub sharedram: u64,
    /// Memory used by buffers
    pub bufferram: u64,
    /// Total swap space size
    pub totalswap: u64,
    /// swap space still available
    pub freeswap: u64,
    /// Number of current processes
    pub procs: u16,
    /// Explicit padding for m68k
    pub pad: u16,
    /// Total high memory size
    pub totalhigh: u64,
    /// Available high memory size
    pub freehigh: u64,
    /// Memory unit size in bytes
    pub mem_uint: u32,
    /// Padding: libc5 uses this..
    pub _f: [u8; _F_SIZE],
}

pub fn sys_sysinfo(info: *mut Sysinfo) -> SyscallRet {
    trace!("[sys_sysinfo] enter.");
    warn!("[sys_sysinfo] not fully implemented");
    let sys_info = Sysinfo {
        uptime: (get_time_ms() / 1000) as i64,
        loads: [0; 3],
        totalram: 0,
        freeram: 0,
        sharedram: 0,
        bufferram: 0,
        totalswap: 0,
        freeswap: 0,
        procs: 0,
        pad: 0,
        totalhigh: 0,
        freehigh: 0,
        mem_uint: 0,
        _f: [0; _F_SIZE],
    };
    unsafe {
        ptr::write(info, sys_info);
    }
    Ok(0)
}

// pub fn sys_syslog() -> SyscallRet {
//     trace!("[sys_syslog] enter");
//     warn!("[sys_syslog] not implemented");
//     Ok(0)
// }

pub fn sys_clock_getres(clock_id: usize, res: *mut TimeSpec) -> SyscallRet {
    trace!(
        "[sys_clock_getres] enter. clock_id: {}, res: {:#x}",
        clock_id,
        res as usize
    );
    warn!("[sys_clock_getres] not fully implemented");
    unsafe {
        res.write_volatile(TimeSpec { sec: 0, nsec: 1 });
    }
    Ok(0)
}

/// # 指定任务进行睡眠
///
/// # Arguments
/// * id: usize,指定使用的时钟ID,对应结构体为ClockId
///
/// * flags: usize,指定是使用相对时间还是绝对时间
///
/// * request: *const TimeSecs指定睡眠的时间,根据flags划分为相对时间或者绝对时间
///
/// * remain: *mut TimeSecs存储剩余睡眠时间。当任务提前醒来时,如果flags不为绝对时间,且remain不为空,则将剩余存储时间存进remain所指向地址。
///
/// 若睡眠被信号处理打断或者遇到未知错误，则返回对应错误码
pub async fn syscall_clock_nanosleep(
    _id: usize,
    _flags: usize,
    request: usize,
    _remain: usize,
) -> SyscallRet {
    trace!("[sys_nanosleep] enter");
    let sleep_ms = {
        let request = request as *const TimeSpec;
        let time_val = unsafe { &(*request) };
        time_val.sec * 1000 + time_val.nsec / 1000000
    };
    crate::timer::TimeoutFuture::new(core::time::Duration::from_millis(sleep_ms as u64)).await

    // // let id = args[0];
    // // let flags = args[1];
    // let request = args[2] as *const TimeSecs;
    // let remain = args[3] as *mut TimeSecs;
    // const TIMER_ABSTIME: usize = 1;

    // let process = current_process();
    // // REVIEW: 这里的request没有实现sized但出问题再说
    // let vpn = VirtAddr::from(request as usize).floor();

    // // REVIEW: manual_alloc_for_lazy本来应该存在错误情况,但你没写之后可能出事
    // process.inner_lock().memory_set.manual_alloc_for_lazy(vpn);
    // let request_time = unsafe { *request };
    // let request_time = core::time::Duration::new(request_time.sec as u64, request_time.nsec as u32);
    // let deadline = if flags != TIMER_ABSTIME {
    //     crate::timer::current_time() + request_time
    // } else {
    //     if request_time < crate::timer::current_time() {
    //         return Ok(0);
    //     }
    //     request_time
    // };

    // // REVIEW: 这里的类型转换从u128到usize可能会有问题
    // // crate::timer::TimeoutFuture::new(deadline).await?;

    // let current_time = crate::timer::current_time();
    // if current_time < deadline && !remain.is_null() {
    //     let vpn = VirtAddr::from(remain as usize).floor();
    //     process.inner.lock().memory_set.manual_alloc_for_lazy(vpn);
    //     let delta = (deadline - current_time).as_nanos() as usize;
    //     unsafe {
    //         *remain = TimeSpec {
    //             sec: delta / 1_000_000_000,
    //             nsec: delta % 1_000_000_000,
    //         }
    //     };
    //     return Err(SyscallErr::EINTR as usize);
    // }
    // Ok(0)
}
