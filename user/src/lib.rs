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

use core::slice;

use alloc::{string::String, vec};
use buddy_system_allocator::LockedHeap;
use num_enum::TryFromPrimitive;
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

pub const AT_FDCWD: i32 = -100;
pub const AT_REMOVEDIR: i32 = 0x200;

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

#[derive(Debug)]
#[repr(C)]
pub struct Kstat {
    pub st_dev: u64,
    pub st_ino: u64,
    pub st_mode: u32,
    pub st_nlink: u32,
    pub st_uid: u32,
    pub st_gid: u32,
    pub st_rdev: u64,
    pub __pad1: usize,
    pub st_size: u64,
    pub st_blksize: u32,
    pub __pad2: u32,
    pub st_blocks: u64,
    pub st_atim: TimeSpec,
    pub st_mtim: TimeSpec,
    pub st_ctim: TimeSpec,
}

#[derive(Debug)]
pub enum SyscallErr {
    EUNDEF = 0,
    EPERM = 1,
    ENOENT = 2,
    ESRCH = 3,
    EINTR = 4,
    EIO = 5,
    ENXIO = 6,
    E2BIG = 7,
    ENOEXEC = 8,
    EBADF = 9,
    ECHILD = 10,
    EAGAIN = 11,
    ENOMEM = 12,
    EACCES = 13,
    EFAULT = 14,
    ENOTBLK = 15,
    EBUSY = 16,
    EEXIST = 17,
    EXDEV = 18,
    ENODEV = 19,
    ENOTDIR = 20,
    EISDIR = 21,
    EINVAL = 22,
    ENFILE = 23,
    EMFILE = 24,
    ENOTTY = 25,
    ETXTBSY = 26,
    EFBIG = 27,
    ENOSPC = 28,
    ESPIPE = 29,
    EROFS = 30,
    EMLINK = 31,
    EPIPE = 32,
    EDOM = 33,
    ERANGE = 34,
    EDEADLK = 35,
    ENAMETOOLONG = 36,
    ENOLCK = 37,
    ENOSYS = 38,
    ENOTEMPTY = 39,
    ELOOP = 40,
    // EWOULDBLOCK = 11,
    ENOMSG = 42,
    EIDRM = 43,
    ECHRNG = 44,
    EL2NSYNC = 45,
    EL3HLT = 46,
    EL3RST = 47,
    ELNRNG = 48,
    EUNATCH = 49,
    ENOCSI = 50,
    EL2HLT = 51,
    EBADE = 52,
    EBADR = 53,
    EXFULL = 54,
    ENOANO = 55,
    EBADRQC = 56,
    EBADSLT = 57,
    // EDEADLOCK = EDEADLK,
    EBFONT = 59,
    ENOSTR = 60,
    ENODATA = 61,
    ETIME = 62,
    ENOSR = 63,
    ENONET = 64,
    ENOPKG = 65,
    EREMOTE = 66,
    ENOLINK = 67,
    EADV = 68,
    ESRMNT = 69,
    ECOMM = 70,
    EPROTO = 71,
    EMULTIHOP = 72,
    EDOTDOT = 73,
    EBADMSG = 74,
    EOVERFLOW = 75,
    ENOTUNIQ = 76,
    EBADFD = 77,
    EREMCHG = 78,
    ELIBACC = 79,
    ELIBBAD = 80,
    ELIBSCN = 81,
    ELIBMAX = 82,
    ELIBEXEC = 83,
    EILSEQ = 84,
    ERESTART = 85,
    ESTRPIPE = 86,
    EUSERS = 87,
    ENOTSOCK = 88,
    EDESTADDRREQ = 89,
    EMSGSIZE = 90,
    EPROTOTYPE = 91,
    ENOPROTOOPT = 92,
    EPROTONOSUPPORT = 93,
    ESOCKTNOSUPPORT = 94,
    EOPNOTSUPP = 95,
    EPFNOSUPPORT = 96,
    EAFNOSUPPORT = 97,
    EADDRINUSE = 98,
    EADDRNOTAVAIL = 99,
    ENETDOWN = 100,
    ENETUNREACH = 101,
    ENETRESET = 102,
    ECONNABORTED = 103,
    ECONNRESET = 104,
    ENOBUFS = 105,
    EISCONN = 106,
    ENOTCONN = 107,
    ESHUTDOWN = 108,
    ETOOMANYREFS = 109,
    ETIMEDOUT = 110,
    ECONNREFUSED = 111,
    EHOSTDOWN = 112,
    EHOSTUNREACH = 113,
    EALREADY = 114,
    EINPROGRESS = 115,
    ESTALE = 116,
    EUCLEAN = 117,
    ENOTNAM = 118,
    ENAVAIL = 119,
    EISNAM = 120,
    EREMOTEIO = 121,
    EDQUOT = 122,
    ENOMEDIUM = 123,
    EMEDIUMTYPE = 124,
    ECANCELED = 125,
    ENOKEY = 126,
    EKEYEXPIRED = 127,
    EKEYREVOKED = 128,
    EKEYREJECTED = 129,
    EOWNERDEAD = 130,
    ENOTRECOVERABLE = 131,
    ERFKILL = 132,
    EHWPOISON = 133,
}

impl From<isize> for SyscallErr {
    fn from(value: isize) -> Self {
        let ret = SyscallErr;
    }
}

pub const NSEC_PER_SEC: usize = 10_0000_0000;

pub type SyscallResult<T> = Result<T, SyscallErr>;

#[derive(Debug, Clone)]
pub struct File {
    fd: i32,
}

impl File {
    pub fn get_fd(&self) -> i32 {
        self.fd
    }

    pub fn open(path: &str, flags: OpenFlags) -> SyscallResult<File> {
        match sys_openat(AT_FDCWD, path, flags, 0) as i32 {
            fd if fd >= 0 => Ok(File { fd }),
            fd => Err(bitflags::_core::a),
        }
    }

    pub fn open_at(&self, path: &str, flags: OpenFlags) -> SyscallResult<File> {
        match sys_openat(self.fd, path, flags, 0) as i32 {
            fd if fd >= 0 => Ok(File { fd }),
            fd => Err(-fd as usize),
        }
    }

    pub fn read(&self, buf: &mut [u8]) -> SyscallResult<usize> {
        match sys_read(self.fd, buf) {
            n if n >= 0 => Ok(n as usize),
            n => Err(-n as usize),
        }
    }

    pub fn write(&self, buf: &[u8]) -> SyscallResult<usize> {
        match sys_write(self.fd, buf) {
            n if n >= 0 => Ok(n as usize),
            n => Err(-n as usize),
        }
    }

    /// return (read_pipe, write_pipe)
    pub fn pipe() -> SyscallResult<(File, File)> {
        let mut fds = [0; 2];
        match sys_pipe2(fds) {
            ret if ret >= 0 => Ok((File { fd: fds[0] }, File { fd: fds[1] })),
            ret => Err(-ret as usize),
        }
    }

    pub fn dup(&self) -> SyscallResult<File> {
        match sys_dup(self.fd) as i32 {
            fd if fd >= 0 => Ok(File { fd }),
            fd => Err(-fd as usize),
        }
    }

    pub fn unlink_at(&self, path: &str) -> SyscallResult<()> {
        match sys_unlinkat(self.fd, path, AT_REMOVEDIR) {
            ret if ret > 0 => Ok(()),
            ret => Err(-ret as usize),
        }
    }

    pub fn mkdir_at(&self, path: &str) -> SyscallResult<()> {
        match sys_mkdirat(self.fd, path, 0) {
            ret if ret > 0 => Ok(()),
            ret => Err(-ret as usize),
        }
    }
}

impl Drop for File {
    fn drop(&mut self) {
        sys_close(self.fd);
    }
}

/// Get path to current working directory
///
/// # Errors
///
/// on error, return `Err(errno)`
pub fn getcwd() -> SyscallResult<String> {
    let mut buffer: vec::Vec<u8> = vec![0u8; 4096];
    match sys_getcwd(buffer.as_mut_slice()) {
        ptr if ptr == 0 as *const u8 => Err(1),
        _ => Ok(String::from_utf8(buffer).unwrap()),
    }
}

/// Changes the current working directory to the specified path.
///
/// # Arguments
///
/// * `path` - A string slice that holds the path of the directory to change to.
///
/// # Errors
///
/// on error, return `Err(errno)`
pub fn chdir(path: &str) -> SyscallResult<()> {
    match sys_chdir(path) {
        ret if ret > 0 => Ok(()),
        ret => Err(-ret as usize),
    }
}

/// Removes a specified directory or file.
///
/// # Arguments
///
/// * `path` - A string slice that holds the path of the file or directory to be removed.
///
/// # Errors
///
/// on error, return `Err(errno)`
pub fn unlink(path: &str) -> SyscallResult<()> {
    match sys_unlinkat(AT_FDCWD, path, AT_REMOVEDIR) {
        ret if ret > 0 => Ok(()),
        ret => Err(-ret as usize),
    }
}

/// Creates a new directory.
///
/// # Arguments
///
/// * `path` - A string slice that holds the path of the directory to be created.
///
/// # Errors
///
/// on error, return `Err(errno)`
pub fn mkdir(path: &str) -> SyscallResult<()> {
    match sys_mkdirat(AT_FDCWD, path, 0) {
        ret if ret > 0 => Ok(()),
        ret => Err(-ret as usize),
    }
}

/// Creates a child process in a manner similar to `fork`, but provides more precise control over what pieces of execution context are shared
/// between the calling process and the child process.
///
/// # Arguments
///
/// * `flags` - A bit mask that specifies the behavior of the new process.
/// * `stack` - The address of the stack the new process will use.
/// * `ptid` - The location where the parent process ID will be stored.
/// * `tls` - The new value for the Thread Local Storage (TLS).
/// * `ctid` - The location where the child process ID will be stored.
///
/// # Errors
///
/// on error, return `Err(errno)`
pub fn clone(flags: i32, stack: usize, ptid: usize, tls: usize, ctid: usize) -> SyscallResult<()> {
    match sys_clone(flags, stack, ptid, tls, ctid) {
        ret if ret > 0 => Ok(()),
        ret => Err(-ret as usize),
    }
}

/// Replaces the current process image with a new process image.
///
/// # Arguments
///
/// * `path` - A string slice that holds the path of the new program.
/// * `argv` - An array of string slices that represent the argument list to the new program.
/// * `envp` - An array of string slices that represent the environment for the new program.
///
/// # Errors
///
/// on error, return `Err(errno)`
pub fn execve(path: &str, argv: &[&str], envp: &[&str]) -> SyscallResult<()> {
    match sys_execve(path, argv, envp) {
        ret if ret > 0 => Ok(()),
        ret => Err(-ret as usize),
    }
}

/// Waits for a child process to change state.
///
/// # Arguments
///
/// * `pid` - The process ID of the child process to wait for. If `pid` is -1, the wait call waits for any child process.
/// * `exit_code` - The location where the exit code of the child process will be stored.
/// * `options` - see [`WaitOption`]
///
/// # Errors
///
/// on error, return `Err(errno)`
pub fn waitpid(pid: i32, exit_code: &mut i32, options: WaitOption) -> SyscallResult<usize> {
    match sys_wait4(pid as isize, exit_code, options) {
        ret if ret > 0 => Ok(ret as usize),
        ret => Err(-ret as usize),
    }
}

/// Exit current process and never returns
///
/// # Arguments
///
/// * `exit_code` - The exit code of the process.
pub fn exit(exit_code: i32) -> ! {
    sys_exit(exit_code)
}

/// Get the current process ID.
///
/// # Errors
///
/// on error, return `Err(errno)`
pub fn getpid() -> SyscallResult<u32> {
    match sys_getpid() {
        ret if ret >= 0 => Ok(ret as u32),
        ret => Err(-ret as usize),
    }
}

/// Get the current parent process ID.
///
/// # Errors
///
/// on error, return `Err(errno)`
pub fn getppid() -> SyscallResult<u32> {
    match sys_getppid() {
        ret if ret >= 0 => Ok(ret as u32),
        ret => Err(-ret as usize),
    }
}

pub fn brk(brk: *const u8) -> SyscallResult<()> {
    match sys_brk(brk) {
        ret if ret >= 0 => Ok(()),
        ret => Err(-ret as usize),
    }
}

pub fn mmap(
    len: usize,
    prot: MMAPPROT,
    flags: MMAPFLAGS,
    file: &File,
    offset: usize,
) -> SyscallResult<&mut [u8]> {
    match sys_mmap(0 as *const u8, len, prot, flags, file.get_fd(), offset) {
        ret if ret >= 0 => Ok(unsafe { slice::from_raw_parts_mut(ret as *mut u8, len) }),
        ret => Err(-ret as usize),
    }
}

pub fn munmap(region: &[u8]) -> SyscallResult<()> {
    match sys_munmap(region.as_ptr() as *const u8, region.len()) {
        ret if ret >= 0 => Ok(()),
        ret => Err(-ret as usize),
    }
}

pub fn gettime() -> SyscallResult<TimeSpec> {
    let mut time = TimeSpec { sec: 0, nsec: 0 };
    match sys_gettimeofday(&mut time) {
        ret if ret >= 0 => Ok(time),
        ret => Err(-ret as usize),
    }
}

pub fn sched_yield() -> SyscallResult<()> {
    match sys_sched_yield() {
        ret if ret >= 0 => Ok(()),
        ret => Err(-ret as usize),
    }
}

pub fn nanosleep(req: &TimeSpec) -> SyscallResult<Option<TimeSpec>> {
    let rem = &mut TimeSpec { sec: 0, nsec: 0 };
    match sys_nanosleep(req, rem) {
        ret if ret >= 0 => Ok(None),
        ret if ret == (SyscallErr::EINTR as isize) => Ok(Some(*rem)),
        ret => Err(-ret as usize),
    }
}

// pub fn 
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
