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

// POSIX syscall interface
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
const SYS_FCNTL: usize = 25;
const SYS_WRITEV: usize = 66;
const SYS_GETEUID: usize = 175;
const SYS_PPOLL: usize = 73;
const SYS_CLOCK_GETTIME: usize = 113;
const SYS_SYSINFO: usize = 179;
const SYS_SYSLOG: usize = 116;
const SYS_FSTATAT: usize = 79;
const SYS_FACCESSAT: usize = 48;
const SYS_UTIMENSAT: usize = 88;
const SYS_RT_SIGRETURN: usize = 139;
const SYS_KILL: usize = 129;

const SYS_MPROTECT: usize = 226;
// const SYS_UTIMENSAT: usize = 88;
const SYS_SENDFILE: usize = 71;
const SYS_LSEEK: usize = 62;
const SYS_GETPGID: usize = 155;
const SYS_GETTID: usize = 178;
const SYS_READV: usize = 65;
const SYS_SCHED_GETAFFINITY: usize = 123;
const SYS_SCHED_GETSCHEDULER: usize = 120;
const SYS_SCHED_GETPARAM: usize = 121;
const SYS_SOCKETPAIR: usize = 199;
const SYS_SCHED_SETSCHEDULER: usize = 119;
const SYS_CLOCK_GETRES: usize = 114;
// const SYS_FUTEX: usize = 202;
// const SYS_FUTEX: usize = 98;
const SYS_MADVISE: usize = 233;
// const SYS_PRLIMIT: usize = 261;
// const SYS_SIGTIMEDWAIT: usize = 137;
// const SYS_TKILL: usize = 130;
const SYS_GETAFFINITY: usize = 122;
// const SYS_CLOCK_NANOSLEEP: usize = 115;
const SYS_READLINKAT: usize = 78;
const SYS_SYNC: usize = 81;
const SYS_FSYNC: usize = 82;
const SYS_FTRUNCATE64: usize = 46;

const SYS_SHMGET: usize = 194;
const SYS_RT_SIGTIMEDWAIT: usize = 137;
const SYS_PRLIMIT64: usize = 261;
const SYS_MEMBARRIER: usize = 283;
const SYS_STATFS: usize = 43;
// const SYS_READLINKAT: usize = 78;

const SYS_SPLICE: usize = 76;

mod fs;
mod mm;
pub(crate) mod process;
pub(crate) mod resource;
mod util;

use fs::*;
use log::{error, warn};
use mm::*;
use process::*;
pub use process::{WaitFuture, WaitOption};
use util::{sys_clock_getres, sys_clock_gettime, sys_get_time, sys_sysinfo, sys_times, sys_uname};

use crate::signal::sys_rt_sigtimedwait;
use crate::syscall::resource::{sys_prlimit64, RLimit};
use crate::{
    config::SyscallRet,
    // futex::sys_futex,
    signal::{sys_kill, sys_rt_sigaction, sys_rt_sigerturn, sys_rt_sigprocmask},
};

/// handle syscall exception with `syscall_id` and other arguments
pub async fn syscall(syscall_id: usize, args: [usize; 6]) -> SyscallRet {
    match syscall_id {
        SYS_EXIT => sys_exit(args[0] as i32),
        SYS_GETPID => sys_getpid(),
        SYS_CLONE => sys_clone(args[0], args[1], args[2], args[3], args[4]),
        SYS_EXECVE => sys_execve(args[0], args[1], args[2]).await,
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
        SYS_FSTAT => sys_fstat(args[0], args[1] as *mut _),
        SYS_GETDENTS64 => sys_getdents64(args[0], args[1] as usize, args[2]),
        SYS_DUP => sys_dup(args[0]),
        SYS_DUP3 => sys_dup3(args[0], args[1]),
        SYS_UNLINKAT => sys_unlinkat(args[0] as isize, args[1] as *const u8, args[2] as u32),
        SYS_PIPE2 => sys_pipe2(args[0] as *const u8, args[1] as u32),
        SYS_LINKAT => dummy(SYS_LINKAT, "sys_linkat"),
        SYS_MOUNT => dummy(SYS_MOUNT, "sys_mount"),
        SYS_UMOUNT2 => dummy(SYS_UMOUNT2, "sys_umount2"),
        SYS_NANOSLEEP => sys_nanosleep(args[0]).await,
        SYS_GETPPID => sys_getppid(),
        SYS_WAIT4 => sys_wait4(args[0] as isize, args[1], args[2] as i32).await,

        SYS_SET_TID_ADDRESS => sys_set_tid_address(args[0] as *const usize),
        SYS_GETUID => dummy(SYS_GETUID, "sys_getuid"),
        SYS_IOCTL => sys_ioctl(args[0] as i32, args[1], args[2] as usize),
        SYS_EXIT_GROUP => sys_exit_group(args[0] as i32),
        SYS_RT_SIGACTION => sys_rt_sigaction(args[0], args[1], args[2]),
        SYS_RT_SIGPROCMASK => sys_rt_sigprocmask(args[0] as i32, args[1], args[2]),
        SYS_RT_SIGRETURN => sys_rt_sigerturn(),
        SYS_FCNTL => sys_fcntl(args[0], args[1] as i32, args[2]),
        SYS_WRITEV => sys_writev(args[0], args[1], args[2] as i32).await,
        SYS_GETEUID => dummy(SYS_GETEUID, "sys_geteuid"),
        SYS_PPOLL => sys_ppoll(args[0], args[1], args[2], args[3]),
        SYS_CLOCK_GETTIME => sys_clock_gettime(args[0], args[1] as *mut _),
        SYS_SYSINFO => sys_sysinfo(args[0] as *mut _),
        SYS_SYSLOG => dummy(SYS_SYSLOG, "sys_syslog"),
        SYS_FSTATAT => sys_fstatat(
            args[0] as i32,
            args[1] as *const u8,
            args[2] as *mut _,
            args[3] as i32,
        ),
        SYS_FACCESSAT => sys_faccessat(
            args[0] as i32,
            args[1] as *const _,
            args[2] as u32,
            args[3] as u32,
        ),
        SYS_UTIMENSAT => sys_utimensat(
            args[0] as i32,
            args[1] as *const _,
            args[2] as *const _,
            args[3] as i32,
        ),

        SYS_MPROTECT => sys_mprotect(args[0], args[1], args[2]),
        SYS_KILL => sys_kill(args[0] as isize, args[1]),
        SYS_SENDFILE => {
            sys_sendfile(
                args[0] as i32,
                args[1] as i32,
                args[2] as usize,
                args[3] as usize,
            )
            .await
        }

        SYS_LSEEK => sys_lseek(args[0] as i32, args[1] as isize, args[2] as i32),
        SYS_GETPGID => sys_getpgid(args[0] as i32),
        SYS_GETTID => sys_gettid(),
        SYS_READV => sys_readv(args[0], args[1], args[2] as i32).await,
        SYS_SCHED_GETAFFINITY => dummy(SYS_SCHED_GETAFFINITY, "sys_sched_getaffinity"),
        SYS_SCHED_GETSCHEDULER => dummy(SYS_SCHED_GETSCHEDULER, "sys_sched_getscheduler"),
        SYS_SCHED_GETPARAM => dummy(SYS_SCHED_GETPARAM, "sys_sched_getparam"),
        SYS_SOCKETPAIR => sys_socketpair(
            args[0] as u32,
            args[1] as u32,
            args[2] as u32,
            args[3] as usize,
        ),
        SYS_SYNC => sys_sync().await,
        SYS_SHMGET => sys_shmget(args[0], args[1], args[2] as u32),
        SYS_RT_SIGTIMEDWAIT => sys_rt_sigtimedwait(
            args[0] as *const u32,
            args[1] as *const u8,
            args[2] as *const u8,
        ),
        SYS_PRLIMIT64 => sys_prlimit64(
            args[0],
            args[1] as u32,
            args[2] as *const RLimit,
            args[3] as *mut RLimit,
        ),
        // Weird bug, you cannot enter shell with next line enabled.
        SYS_SCHED_SETSCHEDULER => dummy(SYS_SCHED_SETSCHEDULER, "sys_sched_setscheduler"),
        SYS_CLOCK_GETRES => sys_clock_getres(args[0], args[1] as *mut _),
        // SYS_GETTID => sys_getpid(),
        SYS_MADVISE => sys_madvise(args[0], args[1], args[2] as i32),
        // SYS_PRLIMIT => dummy(SYS_PRLIMIT, "prlimit64"),
        // SYS_SIGTIMEDWAIT => dummy(SYS_SIGTIMEDWAIT, "sigtimedwait"),
        //SYS_TKILL => sys_tkill(args[0], args[1]),
        SYS_GETAFFINITY => dummy(SYS_GETAFFINITY, "getaffinity"),
        // SYS_READLINKAT => dummy(SYS_READLINKAT, "readlinkat"),
        // SYS_SYNC => dummy(SYS_SYNC, "sync"),
        SYS_FSYNC => dummy(SYS_FSYNC, "fsync"),
        SYS_FTRUNCATE64 => dummy(SYS_FTRUNCATE64, "ftruncate64"),

        // SYS_FUTEX => {
        //     sys_futex(
        //         args[0],
        //         args[1] as i32,
        //         args[2] as u32,
        //         args[3],
        //         args[4],
        //         args[5] as u32,
        //     )
        //     .await
        // }
        SYS_MEMBARRIER => dummy(SYS_MEMBARRIER, "sys_mem_barrier"),
        SYS_STATFS => dummy(SYS_STATFS, "sys_statfs"),
        SYS_READLINKAT => sys_readlinkat(args[0], args[1], args[2], args[3]),

        SYS_SPLICE => {
            sys_splice(
                args[0] as i32,
                args[1],
                args[2] as i32,
                args[3],
                args[4],
                args[5] as u32,
            )
            .await
        }
        _ => unknown(syscall_id),
    }
}

/// we know that the syscall but not implemented
fn dummy(syscall_id: usize, syscall_name: &str) -> SyscallRet {
    warn!(
        "Unimplemented syscall: {}, id: {}",
        syscall_name, syscall_id
    );
    Ok(0)
}

/// unknown syscall
fn unknown(syscall_id: usize) -> SyscallRet {
    // panic!("Unsupported syscall_id: {}", syscall_id);
    error!("Unknown syscall_id: {}", syscall_id);
    let _ = sys_exit(0);
    Ok(0)
}
