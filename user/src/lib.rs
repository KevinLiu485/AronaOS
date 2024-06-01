#![no_std]
#![feature(linkage)]
#![feature(panic_info_message)]
#![feature(alloc_error_handler)]

#[macro_use]
pub mod console;
mod lang_items;
mod syscall;

extern crate alloc;
#[macro_use]
extern crate bitflags;

use buddy_system_allocator::LockedHeap;
use syscall::*;

const USER_HEAP_SIZE: usize = 32768;

static mut HEAP_SPACE: [u8; USER_HEAP_SIZE] = [0; USER_HEAP_SIZE];

#[global_allocator]
static HEAP: LockedHeap = LockedHeap::empty();

#[alloc_error_handler]
pub fn handle_alloc_error(layout: core::alloc::Layout) -> ! {
    panic!("Heap allocation error, layout = {:?}", layout);
}

#[no_mangle]
#[link_section = ".text.entry"]
pub extern "C" fn _start() -> ! {
    unsafe {
        HEAP.lock()
            .init(HEAP_SPACE.as_ptr() as usize, USER_HEAP_SIZE);
    }
    exit(main());
}

#[linkage = "weak"]
#[no_mangle]
fn main() -> i32 {
    panic!("Cannot find main!");
}

bitflags! {
    pub struct OpenFlags: u32 {
        const RDONLY = 0;
        const WRONLY = 1 << 0;
        const RDWR = 1 << 1;
        const CREATE = 1 << 9;
        const TRUNC = 1 << 10;
    }
}

pub const MAX_NAME_LEN: usize = 256;

#[derive(Debug)]
#[repr(C)]
pub struct Dirent {
    /// 64-bit inode number
    pub d_ino: usize,
    /// 64-bit offset to next derent
    pub d_off: usize,
    /// Size of this dirent
    pub d_reclen: u16,
    /// File type
    pub d_type: u8,
    /// File name
    pub d_name: [u8; MAX_NAME_LEN],
}

bitflags! {
    pub struct WaitOption: i32 {
        /// 这个选项用于非阻塞挂起。当与 wait 或 waitpid 一起使用时，如果没有任何子进程状态改变，
        /// 这些系统调用不会阻塞父进程，而是立即返回。在 Linux 中，如果没有子进程处于可等待的状态，wait 或 waitpid 会返回 0。
        const WNOHANG = 1;
        /// 这个选项告诉 wait 或 waitpid 也报告那些已经停止（stopped），但尚未终止的子进程的状态。默认情况下，
        /// 只有当子进程终止时，它们的结束状态才会被报告。如果子进程被某种信号（如 SIGSTOP 或 SIGTSTP）停止，
        /// 并且父进程没有设置 WUNTRACED 选项，那么父进程将不会感知到子进程的停止状态，直到子进程被继续执行或终止。
        const WUNTRACED = 1 << 1;
        /// 当子进程被停止后又继续执行时，使用这个选项。如果子进程之前被一个停止信号（如SIGSTOP 或 SIGTSTP）暂停，
        /// 然后通过继续信号（如 SIGCONT）被继续执行，那么 wait 或 waitpid 将报告这个子进程的状态，
        /// 即使它还没有终止。这允许父进程知道子进程已经从停止状态恢复。
        const WCONTINUED = 1 << 3;
    }
}

bitflags! {
    /// MMAP memeory protection
    pub struct MMAPPROT: u32 {
        /// Readable
        const PROT_READ = 1 << 0;
        /// Writeable
        const PROT_WRITE = 1 << 1;
        /// Executable
        const PROT_EXEC = 1 << 2;
    }
}

pub const AT_FDCWD: isize = -100;
pub const AT_REMOVEDIR: u32 = 0x200;

/// sys_times, 单位都是us
#[repr(C)]
pub struct Tms {
    /// CPU time spent executing instructions of the calling process
    pub utime: usize,
    /// inside the kernel
    pub stime: usize,
    /// the sum of the utime for all waited-for teminated children
    pub cutime: usize,
    /// the sum of stime for all waited-for teminated children
    pub cstime: usize,
}

#[repr(C)]
pub struct Utsname {
    /// 系统名称
    pub sysname: [u8; 65],
    /// 网络上主机名称
    pub nodename: [u8; 65],
    /// 发行编号
    pub release: [u8; 65],
    /// 版本
    pub version: [u8; 65],
    /// 域名
    pub machine: [u8; 65],
}


#[derive(Clone, Copy, Debug)]
#[repr(C)]
pub struct TimeSpec {
    pub sec: usize,
    pub nsec: usize,
}

bitflags! {
    /// determines whether updates to the mapping are visible to other processes mapping the same region, and whether
    /// updates are carried through to the underlying file.
    pub struct MMAPFLAGS: u32 {
        /// MAP_SHARED
        const MAP_SHARED = 1 << 0;
        /// MAP_PRIVATE
        const MAP_PRIVATE = 1 << 1;
        /// 以上两种只能选一
        /// MAP_FIXED, 一定要映射到addr, 不是作为hint, 要取消原来位置的映射
        const MAP_FIXED = 1 << 4;
        /// MAP_ANONYMOUS, 需要fd为-1, offset为0
        const MAP_ANONYMOUS = 1 << 5;
    }
}

pub const NSEC_PER_SEC: usize = 10_0000_0000;

// pub fn open(path: &str, flags: OpenFlags) -> isize {
//     sys_open(path, flags.bits)
// }
// pub fn close(fd: usize) -> isize {
//     sys_close(fd)
// }
// pub fn read(fd: usize, buf: &mut [u8]) -> isize {
//     sys_read(fd, buf)
// }
// pub fn write(fd: usize, buf: &[u8]) -> isize {
//     sys_write(fd, buf)
// }
// pub fn exit(exit_code: i32) -> ! {
//     sys_exit(exit_code);
// }
// pub fn yield_() -> isize {
//     sys_yield()
// }
// pub fn get_time() -> isize {
//     sys_get_time()
// }
// pub fn getpid() -> isize {
//     sys_getpid()
// }
// pub fn fork() -> isize {
//     sys_fork()
// }
// pub fn exec(path: &str) -> isize {
//     sys_exec(path)
// }
// pub fn wait(exit_code: &mut i32) -> isize {
//     loop {
//         match sys_waitpid(-1, exit_code as *mut _) {
//             -2 => {
//                 yield_();
//             }
//             // -1 or a real pid
//             exit_pid => return exit_pid,
//         }
//     }
// }

// pub fn waitpid(pid: usize, exit_code: &mut i32) -> isize {
//     loop {
//         match sys_waitpid(pid as isize, exit_code as *mut _) {
//             -2 => {

//                 yield_();
//             }
//             // -1 or a real pid
//             exit_pid => return exit_pid,
//         }
//     }
// }
// pub fn sleep(period_ms: usize) {
//     let start = sys_get_time();
//     while sys_get_time() < start + period_ms as isize {
//         sys_yield();
//     }
// }
