use log::{error, trace, warn};

use crate::{
    ctypes::*,
    timer::{get_time_ms, TimeSpec},
    utils::SyscallErr,
    SyscallRet,
};
use core::{mem::size_of, ptr};

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
    warn!("[sys_times] not implemented");
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
        CLOCK_REALTIME => {
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
    warn!("[sys_sysinfo] not implemented");
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

pub fn sys_syslog() -> SyscallRet {
    trace!("[sys_syslog] enter");
    warn!("[sys_syslog] not implemented");
    Ok(0)
}
