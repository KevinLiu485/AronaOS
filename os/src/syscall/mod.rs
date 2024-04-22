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

const SYSCALL_OPEN: usize = 56;
const SYSCALL_CLOSE: usize = 57;
const SYSCALL_READ: usize = 63;
const SYSCALL_WRITE: usize = 64;
const SYSCALL_YIELD: usize = 124;
const SYSCALL_GET_TIME: usize = 169;

/*======================================= 进程管理相关系统调用 =======================================*/

// define SYS_clone 220
// 功能：创建一个子进程；
// 输入：
// flags: 创建的标志，如SIGCHLD；
// stack: 指定新进程的栈，可为0；
// ptid: 父线程ID；
// tls: TLS线程本地存储描述符；
// ctid: 子线程ID；
// 返回值：成功则返回子进程的线程ID，失败返回-1；
// const SYS_CLONE: usize = 220;
const SYSCALL_FORK: usize = 220;

//  SYS_execve 221
// 功能：执行一个指定的程序；
// 输入：
// path: 待执行程序路径名称，
// argv: 程序的参数，
// envp: 环境变量的数组指针
// 返回值：成功不返回，失败返回-1；
// const char *path, char *const argv[], char *const envp[];
// int ret = syscall(SYS_execve, path, argv, envp);
const SYSCALL_EXEC: usize = 221;

// SYS_wait4 260
// 功能：等待进程改变状态;
// 输入：
// pid: 指定进程ID，可为-1等待任何子进程；
// status: 接收状态的指针；
// options: 选项：WNOHANG，WUNTRACED，WCONTINUED；
// 返回值：成功则返回进程ID；如果指定了WNOHANG，且进程还未改变状态，直接返回0；失败则返回-1；
// pid_t pid, int *status, int options;
// pid_t ret = syscall(SYS_wait4, pid, status, options);
const SYSCALL_WAITPID: usize = 260;

// define SYS_exit 93
// 功能：触发进程终止，无返回值；
// 输入：终止状态值；
// 返回值：无返回值；
// int ec;
// syscall(SYS_exit, ec);
const SYSCALL_EXIT: usize = 93;

// define SYS_getppid 173
// 功能：获取父进程ID；
// 输入：系统调用ID；
// 返回值：成功返回父进程ID；
// pid_t ret = syscall(SYS_getppid);
const SYS_GETPPID: usize = 173;

// define SYS_getpid 172
// 功能：获取进程ID；
// 输入：系统调用ID；
// 返回值：成功返回进程ID；
// pid_t ret = syscall(SYS_getpid);
const SYSCALL_GETPID: usize = 172;

mod fs;
mod process;

use fs::*;
use process::*;
/// handle syscall exception with `syscall_id` and other arguments
pub async fn syscall(syscall_id: usize, args: [usize; 3]) -> isize {
    match syscall_id {
        SYSCALL_OPEN => sys_open(args[0] as *const u8, args[1] as u32),
        SYSCALL_CLOSE => sys_close(args[0]),
        SYSCALL_READ => sys_read(args[0], args[1] as *const u8, args[2]),
        SYSCALL_WRITE => sys_write(args[0], args[1] as *const u8, args[2]),
        SYSCALL_EXIT => sys_exit(args[0] as i32),
        SYSCALL_YIELD => sys_yield().await,
        SYSCALL_GET_TIME => sys_get_time(),
        SYSCALL_GETPID => sys_getpid(),
        SYS_GETPPID => sys_getppid(),
        SYSCALL_FORK => sys_fork(),
        SYSCALL_EXEC => sys_exec(args[0] as *const u8),
        SYSCALL_WAITPID => sys_waitpid(args[0] as isize, args[1] as *mut i32),
        _ => panic!("Unsupported syscall_id: {}", syscall_id),
    }
}
