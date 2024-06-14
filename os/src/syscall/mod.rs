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

// const SYSCALL_OPEN: usize = 56;
// const SYSCALL_CLOSE: usize = 57;
// const SYSCALL_READ: usize = 63;
// const SYSCALL_WRITE: usize = 64;
// const SYSCALL_EXIT: usize = 93;
// const SYSCALL_YIELD: usize = 124;
// const SYSCALL_UNAME: usize = 160;
// const SYSCALL_GET_TIME: usize = 169;
// const SYSCALL_GETPID: usize = 172;
// const SYSCALL_BRK: usize = 214;
// const SYSCALL_FORK: usize = 220;
// const SYSCALL_EXEC: usize = 221;
// const SYSCALL_MMAP: usize = 222;
// const SYSCALL_WAITPID: usize = 260;

// os-comp testsuits
// #[allow(non_upper_case_globals)]
const SYS_GETCWD: usize = 17;
const SYS_PIPE2: usize = 59;
const SYS_DUP: usize = 23;
const SYS_DUP3: usize = 24;
const SYS_CHDIR: usize = 49;
const SYS_OPENAT: usize = 56;
const SYS_CLOSE: usize = 57;
const SYS_GETDENTS64: usize = 61;
const SYS_READ: usize = 63;
const SYS_WRITE: usize = 64;
const SYS_LINKAT: usize = 37;
const SYS_UNLINKAT: usize = 35;
const SYS_MKDIRAT: usize = 34;
const SYS_UMOUNT2: usize = 39;
const SYS_MOUNT: usize = 40;
const SYS_FSTAT: usize = 80;

const SYS_CLONE: usize = 220;
const SYS_EXECVE: usize = 221;
const SYS_WAIT4: usize = 260;
const SYS_EXIT: usize = 93;
const SYS_GETPPID: usize = 173;
const SYS_GETPID: usize = 172;

const SYS_BRK: usize = 214;
const SYS_MUNMAP: usize = 215;
const SYS_MMAP: usize = 222;
const SYS_TIMES: usize = 153;
const SYS_UNAME: usize = 160;
const SYS_SCHED_YIELD: usize = 124;
const SYS_GETTIMEOFDAY: usize = 169;
const SYS_NANOSLEEP: usize = 101;

const SYS_SET_TID_ADDRESS: usize = 96;
const SYS_GETUID: usize = 174;
const SYS_IOCTL: usize = 29;
const SYS_EXIT_GROUP: usize = 94;

const SYS_RT_SIGACTION: usize = 134;
const SYS_RT_SIGPROCMASK: usize = 135;
const SYS_RT_SIGRETURN: usize = 139;

mod fs;
mod mm;
mod process;
mod util;

use fs::*;
// use log::error;
use mm::*;
use process::*;
pub use process::{WaitFuture, WaitOption};
use util::{sys_times, sys_uname};

use crate::{
    config::SyscallRet,
    signal::{sys_rt_sigaction, sys_rt_sigerturn, sys_rt_sigprocmask},
};
/// handle syscall exception with `syscall_id` and other arguments
pub async fn syscall(syscall_id: usize, args: [usize; 6]) -> SyscallRet {
    match syscall_id {
        SYS_EXIT => sys_exit(args[0] as i32),
        SYS_GETPID => sys_getpid(),
        SYS_CLONE => sys_clone(args[0], args[1], args[2], args[3], args[4]),
        SYS_EXECVE => sys_exec(args[0], args[1], args[2]).await,
        SYS_UNAME => sys_uname(args[0]),
        SYS_GETTIMEOFDAY => sys_get_time(args[0]),
        SYS_BRK => sys_brk(args[0]),
        SYS_SCHED_YIELD => sys_yield().await,
        SYS_TIMES => sys_times(args[0]),

        SYS_MMAP => sys_mmap(args[0], args[1], args[2], args[3], args[4] as i32, args[5]).await,
        SYS_MUNMAP => sys_munmap(args[0], args[1]),
        SYS_GETCWD => sys_getcwd(args[0], args[1]),
        SYS_OPENAT => sys_openat(
            args[0] as isize,
            args[1] as *const u8,
            args[2] as u32,
            args[3],
        ),
        SYS_READ => sys_read(args[0], args[1], args[2]).await,
        SYS_WRITE => sys_write(args[0], args[1], args[2]).await,
        SYS_MKDIRAT => sys_mkdirat(args[0] as isize, args[1] as *const u8, args[2]),
        SYS_CHDIR => sys_chdir(args[0] as *const u8),
        SYS_CLOSE => sys_close(args[0]),
        SYS_FSTAT => sys_fstat(args[0], args[1] as *const u8),
        SYS_GETDENTS64 => sys_getdents64(args[0], args[1] as *const u8, args[2]),
        SYS_DUP => sys_dup(args[0]),
        SYS_DUP3 => sys_dup3(args[0], args[1]),
        SYS_UNLINKAT => sys_unlinkat(args[0] as isize, args[1] as *const u8, args[2] as u32),
        SYS_PIPE2 => sys_pipe2(args[0] as *const u8),
        SYS_LINKAT => unsupported(SYS_LINKAT),
        SYS_MOUNT => sys_mount(),
        SYS_UMOUNT2 => sys_umount2(),

        SYS_NANOSLEEP => sys_nanosleep(args[0]).await,
        SYS_GETPPID => sys_getppid(),
        SYS_WAIT4 => sys_wait4(args[0] as isize, args[1], args[2] as i32).await,

        SYS_SET_TID_ADDRESS => sys_set_tid_address(args[0] as *const usize),
        SYS_GETUID => sys_getuid(),
        SYS_IOCTL => sys_ioctl(),
        SYS_EXIT_GROUP => sys_exit_group(args[0] as i32),

        SYS_RT_SIGACTION => sys_rt_sigaction(args[0], args[1], args[2]),
        SYS_RT_SIGPROCMASK => sys_rt_sigprocmask(args[0] as i32, args[1], args[2]),
        SYS_RT_SIGRETURN => sys_rt_sigerturn(),

        _ => unsupported(syscall_id),
    }
}

fn unsupported(syscall_id: usize) -> SyscallRet {
    panic!("Unsupported syscall_id: {}", syscall_id);
    // error!("Unsupported syscall_id: {}", syscall_id);
    // let _ = sys_exit(0);
    // Ok(0)
}
