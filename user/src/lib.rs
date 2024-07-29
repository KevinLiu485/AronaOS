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

use alloc::{
    string::{String, ToString},
    vec,
    vec::Vec,
};
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

fn to_c_string(s: &str) -> String {
    s.to_string() + "\0"
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
    /// * `path` - A string slice that holds the path of the file to be opened, can either be absolute or relative to cwd
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
        match sys_openat(AT_FDCWD, &to_c_string(path), flags, 0) {
            ret if ret >= 0 => Ok(File { fd: ret as i32 }),
            ret => Err(ret.into()),
        }
    }

    /// Open a file relative to a directory file descriptor
    ///
    /// # Arguments
    ///
    /// * `path` - A string slice that holds the path of the file to be opened, can either be absolute or relative to this file descriptor
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
        match sys_openat(self.fd, &to_c_string(path), flags, 0) {
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
    /// * `path` - A string slice that holds the path of the file or directory to be removed, can either be absolute or relative to this file descriptor
    ///
    /// # Errors
    ///
    /// on error, return POSIX errno
    pub fn unlink_at(&self, path: &str) -> SyscallResult<()> {
        match sys_unlinkat(self.fd, &to_c_string(path), AT_REMOVEDIR) {
            ret if ret >= 0 => Ok(()),
            ret => Err(ret.into()),
        }
    }

    /// Create a new directory relative to this file
    ///
    /// # Arguments
    ///
    /// * `path` - A string slice that holds the path of the directory to be created, can either be absolute or relative to this file descriptor
    ///
    /// # Errors
    ///
    /// on error, return POSIX errno
    pub fn mkdir_at(&self, path: &str) -> SyscallResult<()> {
        match sys_mkdirat(self.fd, &to_c_string(path), 0) {
            ret if ret >= 0 => Ok(()),
            ret => Err(ret.into()),
        }
    }

    /// Move the read/write file offset
    ///
    /// # Arguments
    ///
    /// * `file` - The file to operate on
    /// * `offset` - The new offset
    /// * `whence` - Specifies how the offset should be interpreted
    ///
    /// # Returns
    ///
    /// The resulting offset location as measured in bytes from the beginning of the file
    ///
    /// # Errors
    ///
    /// on error, return POSIX errno
    pub fn lseek(&self, offset: isize, whence: i32) -> SyscallResult<usize> {
        match sys_lseek(self.get_fd(), offset, whence) {
            ret if ret >= 0 => Ok(ret as usize),
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
/// * `path` - A string slice that holds the path of the directory to change to.
///
/// # Errors
///
/// on error, return POSIX errno
pub fn chdir(path: &str) -> SyscallResult<()> {
    match sys_chdir(&to_c_string(path)) {
        ret if ret >= 0 => Ok(()),
        ret => Err(ret.into()),
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
/// on error, return POSIX errno
pub fn unlink(path: &str) -> SyscallResult<()> {
    match sys_unlinkat(AT_FDCWD, &to_c_string(path), AT_REMOVEDIR) {
        ret if ret >= 0 => Ok(()),
        ret => Err(ret.into()),
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
/// on error, return POSIX errno
pub fn mkdir(path: &str) -> SyscallResult<()> {
    match sys_mkdirat(AT_FDCWD, &to_c_string(path), 0) {
        ret if ret >= 0 => Ok(()),
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
pub fn clone(
    flags: CloneFlags,
    stack: usize,
    ptid: usize,
    tls: usize,
    ctid: usize,
) -> SyscallResult<()> {
    match sys_clone(flags, stack, ptid, tls, ctid) {
        ret if ret >= 0 => Ok(()),
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
/// * `path` - A string slice that holds the path of the new program.
/// * `argv` - An array of string slices that represent the argument list to the new program.
/// * `envp` - An array of string slices that represent the environment for the new program.
///
/// # Errors
///
/// on error, return POSIX errno
pub fn execve(path: &str, argv: &[&str], envp: &[&str]) -> SyscallResult<()> {
    let argv: Vec<String> = argv.iter().map(|s| to_c_string(s)).collect();
    let mut argv: Vec<*const u8> = argv.iter().map(|s| s.as_ptr() as *const u8).collect();
    argv.push(null());
    let envp: Vec<String> = envp.iter().map(|s| to_c_string(s)).collect();
    let mut envp: Vec<*const u8> = envp.iter().map(|s| s.as_ptr() as *const u8).collect();
    envp.push(null());
    match sys_execve(&to_c_string(path), &argv, &envp) {
        ret if ret >= 0 => Ok(()),
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
        ret if ret >= 0 => Ok(ret as usize),
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
/// A [`TimeVal`] struct that holds the current time
///
/// # Errors
///
/// on error, return POSIX errno
pub fn gettime() -> SyscallResult<TimeVal> {
    let mut time = TimeVal { sec: 0, usec: 0 };
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

/// send data from one file to another
///
/// # Arguments
///
/// * `out_file` - The file to write to
/// * `in_file` - The file to read from
/// * `offset` - The offset of the file to read from
/// * `count` - The number of bytes to send
///
/// # Returns
///
/// The number of bytes sent
///
/// # Errors
///
/// on error, return POSIX errno
pub fn sendfile(
    out_file: &File,
    in_file: &File,
    offset: &mut usize,
    count: usize,
) -> SyscallResult<usize> {
    match sys_sendfile(out_file.get_fd(), in_file.get_fd(), offset, count) {
        ret if ret >= 0 => Ok(ret as usize),
        ret => Err(ret.into()),
    }
}
