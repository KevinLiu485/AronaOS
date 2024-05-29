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

// #![allow(unused)]
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

/*======================================= 进程管理相关系统调用 =======================================*/
/// define SYS_clone 220
/// 功能：创建一个子进程；
/// 输入：
/// flags: 创建的标志，如SIGCHLD；
/// stack: 指定新进程的栈，可为0；
/// ptid: 父线程ID；
/// tls: TLS线程本地存储描述符；
/// ctid: 子线程ID；
/// 返回值：成功则返回子进程的线程ID，失败返回-1；
/// pid_t ret = syscall(SYS_clone, flags, stack, ptid, tls, ctid)
/// todo: not implemented yet
const SYS_clone: usize = 220;
///  SYS_execve 221
/// 功能：执行一个指定的程序；
/// 输入：
/// path: 待执行程序路径名称，
/// argv: 程序的参数，
/// envp: 环境变量的数组指针
/// 返回值：成功不返回，失败返回-1；
/// const char *path, char *const argv[], char *const envp[];
/// int ret = syscall(SYS_execve, path, argv, envp);
/// todo: not implemented yet
const SYS_execve: usize = 221;
/// SYS_wait4 260
/// 功能：等待进程改变状态;
/// 输入：
/// pid: 指定进程ID，可为-1等待任何子进程；
/// status: 接收状态的指针；
/// options: 选项：WNOHANG，WUNTRACED，WCONTINUED；
/// 返回值：成功则返回进程ID；如果指定了WNOHANG，且进程还未改变状态，直接返回0；失败则返回-1；
/// pid_t pid, int *status, int options;
/// pid_t ret = syscall(SYS_wait4, pid, status, options);
/// todo: not implemented yet
const SYS_wait4: usize = 260;
/// 功能：触发进程终止(当前进程)，无返回值；
/// 输入：终止状态值；
/// 返回值：无返回值；
/// int ec;
/// syscall(SYS_exit, ec);
const SYS_exit: usize = 93;
/// 功能：获取父进程ID；(如果父进程死掉了，就返回init process)
/// 输入：系统调用ID；
/// 返回值：成功返回父进程ID；
/// pid_t ret = syscall(SYSCALL_GETPPID);
const SYS_getppid: usize = 173;
/// 功能：获取进程ID；
/// 输入：系统调用ID；
/// 返回值：成功返回进程ID；
/// pid_t ret = syscall(SYSCALL_GETPID);
const SYS_getpid: usize = 172;

const SYS_brk: usize = 214;
const SYS_munmap: usize = 215;
const SYS_mmap: usize = 222;
const SYS_times: usize = 153;
const SYS_uname: usize = 160;
const SYS_sched_yield: usize = 124;
const SYS_gettimeofday: usize = 169;

/// 功能：执行线程睡眠，sleep()库函数基于此系统调用；
/// 输入：睡眠的时间间隔；
/// struct timespec {
///     time_t tv_sec;        /* 秒 */
///     long   tv_nsec;       /* 纳秒, 范围在0~999999999 */
/// };
/// 返回值：成功返回0，失败返回-1;
/// const struct timespec *req, struct timespec *rem;
/// int ret = syscall(SYS_nanosleep, req, rem);
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
        // SYSCALL_OPEN => sys_open(args[0] as *const u8, args[1] as u32),
        // SYSCALL_CLOSE => sys_close(args[0]),
        // SYSCALL_READ => sys_read(args[0], args[1], args[2]).await,
        // SYSCALL_WRITE => sys_write(args[0], args[1], args[2]).await,
        SYS_exit => sys_exit(args[0] as i32),
        // SYSCALL_EXIT => sys_exit(args[0] as i32),
        // SYSCALL_YIELD => sys_yield().await,
        // SYSCALL_UNAME => sys_uname(args[0]),
        // SYSCALL_GET_TIME => sys_get_time(args[0] as *mut TimeVal),
        SYSCALL_GETPID => sys_getpid(),
        // SYSCALL_BRK => sys_brk(args[0]),
        SYS_clone => sys_clone(args[0], args[1], args[2], args[3], args[4]),
        SYS_execve => sys_exec(args[0], args[1], args[2]).await,
        SYSCALL_MMAP => sys_mmap(args[0], args[1], args[2], args[3], args[4], args[5]),
        SYSCALL_WAITPID => sys_waitpid(args[0] as isize, args[1] as *mut i32),

        SYS_uname => sys_uname(args[0]),
        SYS_gettimeofday => sys_get_time(args[0] as *mut TimeVal),
        SYS_brk => sys_brk(args[0]),
        SYS_sched_yield => sys_yield().await,
        SYS_wait4 => sys_wait4(args[0] as isize, args[1], args[2] as i32).await,
        SYS_getppid => sys_getppid(),
        SYS_nanosleep => sys_nanosleep(args[0]).await,


        SYS_getcwd => sys_getcwd(args[0], args[1]),
        SYS_openat => sys_openat(
            args[0] as isize,
            args[1] as *const u8,
            args[2] as u32,
            args[3],
        ),
        SYS_read => sys_read(args[0], args[1], args[2]).await,
        SYS_write => sys_write(args[0], args[1], args[2]).await,
        SYS_mkdirat => sys_mkdirat(args[0] as isize, args[1] as *const u8, args[2]),
        SYS_chdir => sys_chdir(args[0] as *const u8),
        SYS_close => sys_close(args[0]),
        SYS_fstat => sys_fstat(args[0], args[1] as *const u8),
        SYS_getdents64 => sys_getdents64(args[0], args[1] as *const u8, args[2]),
        SYS_dup => sys_dup(args[0]),
        _ => panic!("Unsupported syscall_id: {}", syscall_id),
    }
}
