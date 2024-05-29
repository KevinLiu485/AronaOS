use crate::{ctypes::*, SyscallRet};
use core::ptr;

/// fake uname  
/// Todo?:
pub fn sys_uname(uts: usize) -> SyscallRet {
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
pub fn sys_times(buf: usize) -> isize {
    let buf = buf as *mut Tms;
    let tms = Tms::default();
    unsafe {
        ptr::write(buf, tms);
    }
    0
}
