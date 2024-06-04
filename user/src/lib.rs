#![no_std]
#![feature(linkage)]
#![feature(panic_info_message)]
#![feature(alloc_error_handler)]

#[macro_use]
pub mod defs;
pub mod console;
mod lang_items;
mod syscall;

extern crate alloc;
#[macro_use]
extern crate bitflags;

use core::{ptr::null, slice};

use alloc::{string::String, vec::Vec, vec};
use buddy_system_allocator::LockedHeap;
use defs::*;
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

#[derive(Debug, Clone)]
pub struct File {
    fd: i32,
}

impl File {
    /// Get file descriptor
    pub fn get_fd(&self) -> i32 {
        self.fd
    }

    /// Open a file
    /// 
    /// # Arguments
    /// 
    /// * `path` - A NULL-TERMINATED string slice that holds the path of the file to be opened, can either be absolute or relative to cwd
    /// * `flags` - See [`OpenFlags`]
    /// 
    /// # Returns
    /// 
    /// Wrapper of a file descriptor
    /// 
    /// # Errors
    /// 
    /// on error, return POSIX errno
    pub fn open(path: &str, flags: OpenFlags) -> SyscallResult<File> {
        match sys_openat(AT_FDCWD, path, flags, 0) {
            ret if ret >= 0 => Ok(File { fd: ret as i32 }),
            ret => Err(ret.into()),
        }
    }

    /// Open a file relative to a directory file descriptor
    /// 
    /// # Arguments
    /// 
    /// * `path` - A NULL-TERMINATED string slice that holds the path of the file to be opened, can either be absolute or relative to this file descriptor
    /// * `flags` - See [`OpenFlags`]
    /// 
    /// # Returns
    /// 
    /// Wrapper of a file descriptor
    /// 
    /// # Errors
    /// 
    /// on error, return POSIX errno
    pub fn open_at(&self, path: &str, flags: OpenFlags) -> SyscallResult<File> {
        match sys_openat(self.fd, path, flags, 0) {
            ret if ret >= 0 => Ok(File { fd: ret as i32 }),
            ret => Err(ret.into()),
        }
    }

    /// Read from file
    /// 
    /// # Arguments
    /// 
    /// * `buf` - A mutable slice of bytes to read data into
    /// 
    /// # Returns
    /// 
    /// Number of bytes read
    /// 
    /// # Errors
    /// 
    /// on error, return POSIX errno
    pub fn read(&self, buf: &mut [u8]) -> SyscallResult<usize> {
        match sys_read(self.fd, buf) {
            ret if ret >= 0 => Ok(ret as usize),
            ret => Err(ret.into()),
        }
    }

    /// Write to file
    /// 
    /// # Arguments
    /// 
    /// * `buf` - A slice of bytes to write to the file
    /// 
    /// # Returns
    /// 
    /// Number of bytes written
    /// 
    /// # Errors
    /// 
    /// on error, return POSIX errno
    pub fn write(&self, buf: &[u8]) -> SyscallResult<usize> {
        match sys_write(self.fd, buf) {
            ret if ret >= 0 => Ok(ret as usize),
            ret => Err(ret.into()),
        }
    }

    /// Create a pair of pipe
    /// 
    /// # Returns
    /// 
    /// A tuple of two file descriptors, the first one is for reading and the second one is for writing
    /// 
    /// # Errors
    /// 
    /// on error, return POSIX errno
    pub fn pipe() -> SyscallResult<(File, File)> {
        let mut fds = [0; 2];
        match sys_pipe2(&mut fds) {
            ret if ret >= 0 => Ok((File { fd: fds[0] }, File { fd: fds[1] })),
            ret => Err(ret.into()),
        }
    }

    /// Duplicate this file's file descriptor
    /// 
    /// # Returns
    /// 
    /// Wrapper of the new file descriptor
    /// 
    /// # Errors
    /// 
    /// on error, return POSIX errno
    pub fn dup(&self) -> SyscallResult<File> {
        match sys_dup(self.fd) {
            ret if ret >= 0 => Ok(File { fd: ret as i32 }),
            ret => Err(ret.into()),
        }
    }

    /// Unlink a file or directory relative to this file
    /// 
    /// # Arguments
    /// 
    /// * `path` - A NULL-TERMINATED string slice that holds the path of the file or directory to be removed, can either be absolute or relative to this file descriptor
    /// 
    /// # Errors
    /// 
    /// on error, return POSIX errno
    pub fn unlink_at(&self, path: &str) -> SyscallResult<()> {
        match sys_unlinkat(self.fd, path, AT_REMOVEDIR) {
            ret if ret > 0 => Ok(()),
            ret => Err(ret.into()),
        }
    }

    /// Create a new directory relative to this file
    /// 
    /// # Arguments
    /// 
    /// * `path` - A NULL-TERMINATED string slice that holds the path of the directory to be created, can either be absolute or relative to this file descriptor
    /// 
    /// # Errors
    /// 
    /// on error, return POSIX errno
    pub fn mkdir_at(&self, path: &str) -> SyscallResult<()> {
        match sys_mkdirat(self.fd, path, 0) {
            ret if ret > 0 => Ok(()),
            ret => Err(ret.into()),
        }
    }
}

impl Drop for File {
    /// Drop this file, close the file descriptor
    fn drop(&mut self) {
        sys_close(self.fd);
    }
}

/// Get path to current working directory
///
/// # Errors
///
/// on error, return POSIX errno
pub fn getcwd() -> SyscallResult<String> {
    // let mut buffer: Vec<u8> = vec![0u8; 4096];
    let mut buffer = vec![0u8; 4096];
    match sys_getcwd(buffer.as_mut_slice()) {
        ptr if ptr == 0 as *const u8 => Err(SyscallErr::EFAULT),
        _ => Ok(String::from_utf8(buffer).unwrap()),
    }
}

/// Changes the current working directory to the specified path.
///
/// # Arguments
///
/// * `path` - A NULL-TERMINATED string slice that holds the path of the directory to change to.
///
/// # Errors
///
/// on error, return POSIX errno
pub fn chdir(path: &str) -> SyscallResult<()> {
    match sys_chdir(path) {
        ret if ret > 0 => Ok(()),
        ret => Err(ret.into()),
    }
}

/// Removes a specified directory or file.
///
/// # Arguments
///
/// * `path` - A NULL-TERMINATED string slice that holds the path of the file or directory to be removed.
///
/// # Errors
///
/// on error, return POSIX errno
pub fn unlink(path: &str) -> SyscallResult<()> {
    match sys_unlinkat(AT_FDCWD, path, AT_REMOVEDIR) {
        ret if ret > 0 => Ok(()),
        ret => Err(ret.into()),
    }
}

/// Creates a new directory.
///
/// # Arguments
///
/// * `path` - A NULL-TERMINATED string slice that holds the path of the directory to be created.
///
/// # Errors
///
/// on error, return POSIX errno
pub fn mkdir(path: &str) -> SyscallResult<()> {
    match sys_mkdirat(AT_FDCWD, path, 0) {
        ret if ret > 0 => Ok(()),
        ret => Err(ret.into()),
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
/// on error, return POSIX errno
pub fn clone(flags: CloneFlags, stack: usize, ptid: usize, tls: usize, ctid: usize) -> SyscallResult<()> {
    match sys_clone(flags, stack, ptid, tls, ctid) {
        ret if ret > 0 => Ok(()),
        ret => Err(ret.into()),
    }
}

pub fn fork() -> SyscallResult<u32> {
    match sys_clone(CloneFlags::SIGCHLD, 0, 0, 0, 0) {
        pid if pid >= 0 => Ok(pid as u32),
        erron => Err(erron.into()),
    }
}

/// Replaces the current process image with a new process image.
///
/// # Arguments
///
/// * `path` - A NULL-TERMINATED string slice that holds the path of the new program.
/// * `argv` - An array of string slices that represent the argument list to the new program. TRAILING NULL IS NOT NEEDED.
/// * `envp` - An array of string slices that represent the environment for the new program. TRAILING NULL IS NOT NEEDED.
///
/// # Errors
///
/// on error, return POSIX errno
pub fn execve(path: &str, argv: &[&str], envp: &[&str]) -> SyscallResult<()> {
    let mut argv: Vec<*const u8> = argv.iter().map(|s| s.as_ptr() as *const u8).collect();
    argv.push(null());
    let mut envp: Vec<*const u8> = envp.iter().map(|s| s.as_ptr() as *const u8).collect();
    envp.push(null());
    match sys_execve(path, &argv, &envp) {
        ret if ret > 0 => Ok(()),
        ret => Err(ret.into()),
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
/// on error, return POSIX errno
pub fn waitpid(pid: i32, exit_code: &mut i32, options: WaitOption) -> SyscallResult<usize> {
    match sys_wait4(pid as isize, exit_code, options) {
        ret if ret > 0 => Ok(ret as usize),
        ret => Err(ret.into()),
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
/// on error, return POSIX errno
pub fn getpid() -> SyscallResult<u32> {
    match sys_getpid() {
        ret if ret >= 0 => Ok(ret as u32),
        ret => Err(ret.into()),
    }
}

/// Get the current parent process ID.
///
/// # Errors
///
/// on error, return POSIX errno
pub fn getppid() -> SyscallResult<u32> {
    match sys_getppid() {
        ret if ret >= 0 => Ok(ret as u32),
        ret => Err(ret.into()),
    }
}

/// Modify the heap size of the calling process.
/// 
/// # Arguments
/// 
/// * `brk` - The new end of the process's data segment
/// 
/// # Errors
/// 
/// on error, return POSIX errno
pub fn brk(brk: *const u8) -> SyscallResult<()> {
    match sys_brk(brk) {
        ret if ret >= 0 => Ok(()),
        ret => Err(ret.into()),
    }
}

/// Map files or devices into memory. Address for mapping is automatically decided by the kernel.
/// 
/// # Arguments
/// 
/// * `len` - The length of the mapping
/// * `prot` - The memory protection of the mapping, see [`MMAPPROT`]
/// * `flags` - The type of the mapping, see [`MMAPFLAGS`]
/// * `file` - The file to map
/// * `offset` - The offset from the beginning of the file
/// 
/// # Returns
/// 
/// A mutable slice of bytes that represents the mapped memory region
/// 
/// # Errors
/// 
/// on error, return POSIX errno
pub fn mmap(
    len: usize,
    prot: MMAPPROT,
    flags: MMAPFLAGS,
    file: &File,
    offset: usize,
) -> SyscallResult<&mut [u8]> {
    match sys_mmap(0 as *const u8, len, prot, flags, file.get_fd(), offset) {
        ret if ret >= 0 => Ok(unsafe { slice::from_raw_parts_mut(ret as *mut u8, len) }),
        ret => Err(ret.into()),
    }
}


/// Unmap mmaped memory region
/// 
/// # Arguments
/// 
/// * `region` - The memory region to unmap
/// 
/// # Errors
/// 
/// on error, return POSIX errno
pub fn munmap(region: &[u8]) -> SyscallResult<()> {
    match sys_munmap(region.as_ptr() as *const u8, region.len()) {
        ret if ret >= 0 => Ok(()),
        ret => Err(ret.into()),
    }
}

/// Get the current time of the system
/// 
/// # Returns
/// 
/// A [`TimeSpec`] struct that holds the current time
/// 
/// # Errors
/// 
/// on error, return POSIX errno
pub fn gettime() -> SyscallResult<TimeSpec> {
    let mut time = TimeSpec { sec: 0, nsec: 0 };
    match sys_gettimeofday(&mut time) {
        ret if ret >= 0 => Ok(time),
        ret => Err(ret.into()),
    }
}

/// Yield the CPU to another process
/// 
/// # Errors
/// 
/// on error, return POSIX errno
pub fn sched_yield() -> SyscallResult<()> {
    match sys_sched_yield() {
        ret if ret >= 0 => Ok(()),
        ret => Err(ret.into()),
    }
}

/// Sleep for a specified period of time of nanoseconds
/// 
/// # Arguments
/// 
/// * `req` - The time to sleep
/// 
/// # Returns
/// 
/// If the sleep is interrupted, return the remaining time to sleep
/// Else, return None
/// 
/// # Errors
/// 
/// on error, return POSIX errno
pub fn nanosleep(req: &TimeSpec) -> SyscallResult<Option<TimeSpec>> {
    let rem = &mut TimeSpec { sec: 0, nsec: 0 };
    match sys_nanosleep(req, rem) {
        ret if ret >= 0 => Ok(None),
        ret if ret == (SyscallErr::EINTR as isize) => Ok(Some(*rem)),
        ret => Err(ret.into()),
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
