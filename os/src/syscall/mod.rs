//! Implementation of syscalls
//!
//! The single entry point to all system calls, [`syscall()`], is called
//! whenever userspace wishes to perform a system call using the `ecall`
//! instruction. In this case, the processor raises an 'Environment call from
//! U-mode' exception, which is handled as one of the cases in
//! [`crate::trap::trap_handler`].
//!
//! For clarity, each single syscall is implemented as its own function, named
//! `sys_` then the name of the syscall. You can find functions like this in
//! submodules, and you should also implement syscalls this way.

#![allow(unused)]
#![allow(non_upper_case_globals)]

const SYSCALL_OPEN: usize = 56;
const SYSCALL_CLOSE: usize = 57;
const SYSCALL_READ: usize = 63;
const SYSCALL_WRITE: usize = 64;
const SYSCALL_EXIT: usize = 93;
const SYSCALL_YIELD: usize = 124;
const SYSCALL_UNAME: usize = 160;
const SYSCALL_GET_TIME: usize = 169;
const SYSCALL_GETPID: usize = 172;
const SYSCALL_BRK: usize = 214;
const SYSCALL_FORK: usize = 220;
const SYSCALL_EXEC: usize = 221;
const SYSCALL_MMAP: usize = 222;
const SYSCALL_WAITPID: usize = 260;

// os-comp testsuits
const SYS_getcwd: usize = 17;
const SYS_pipe2: usize = 59;
const SYS_dup: usize = 23;
const SYS_dup3: usize = 24;
const SYS_chdir: usize = 49;
const SYS_openat: usize = 56;
const SYS_close: usize = 57;
const SYS_getdents64: usize = 61;
const SYS_read: usize = 63;
const SYS_write: usize = 64;
const SYS_linkat: usize = 37;
const SYS_unlinkat: usize = 35;
const SYS_mkdirat: usize = 34;
const SYS_umount2: usize = 39;
const SYS_mount: usize = 40;
const SYS_fstat: usize = 80;

const SYS_clone: usize = 220;
const SYS_execve: usize = 221;
const SYS_wait4: usize = 260;
const SYS_exit: usize = 93;
const SYS_getppid: usize = 173;
const SYS_getpid: usize = 172;

const SYS_brk: usize = 214;
const SYS_munmap: usize = 215;
const SYS_mmap: usize = 222;
const SYS_times: usize = 153;
const SYS_uname: usize = 160;
const SYS_sched_yield: usize = 124;
const SYS_gettimeofday: usize = 169;
const SYS_nanosleep: usize = 101;

mod fs;
mod mm;
mod process;
mod util;

use fs::*;
use log::trace;
use mm::*;
use process::*;
use util::sys_uname;

use crate::{config::SyscallRet, ctypes::TimeVal};
/// handle syscall exception with `syscall_id` and other arguments
pub async fn syscall(syscall_id: usize, args: [usize; 6]) -> SyscallRet {
    match syscall_id {
        SYSCALL_OPEN => sys_open(args[0] as *const u8, args[1] as u32),
        SYSCALL_CLOSE => sys_close(args[0]),
        SYSCALL_READ => sys_read(args[0], args[1], args[2]).await,
        SYSCALL_WRITE => sys_write(args[0], args[1], args[2]).await,
        SYSCALL_EXIT => sys_exit(args[0] as i32),
        // SYSCALL_YIELD => sys_yield().await,
        // SYSCALL_UNAME => sys_uname(args[0]),
        // SYSCALL_GET_TIME => sys_get_time(args[0] as *mut TimeVal),
        SYSCALL_GETPID => sys_getpid(),
        // SYSCALL_BRK => sys_brk(args[0]),
        SYSCALL_FORK => sys_fork(),
        SYSCALL_EXEC => sys_exec(args[0]).await,
        SYSCALL_MMAP => sys_mmap(args[0], args[1], args[2], args[3], args[4], args[5]),
        SYSCALL_WAITPID => sys_waitpid(args[0] as isize, args[1] as *mut i32),

        SYS_getcwd => sys_getcwd(args[0], args[1]),
        SYS_uname => sys_uname(args[0]),
        SYS_gettimeofday => sys_get_time(args[0] as *mut TimeVal),
        SYS_brk => sys_brk(args[0]),
        SYS_sched_yield => sys_yield().await,
        // SYS_chdir => sys_chdir(args[0] as *const u8),
        _ => panic!("Unsupported syscall_id: {}", syscall_id),
    }
}
