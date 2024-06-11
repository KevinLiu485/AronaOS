//! `Arc<Inode>` -> `OSInodeInner`: In order to open files concurrently
//! we need to wrap `Inode` into `Arc`,but `Mutex` in `Inode` prevents
//! file systems from being accessed simultaneously
//!
//! `UPSafeCell<OSInodeInner>` -> `OSInode`: for static `ROOT_INODE`,we
//! need to wrap `OSInodeInner` into `UPSafeCell`
use super::inode::Inode;
use super::path::Path;
use super::{File, FileMeta};
use crate::config::{AsyncResult, SysResult};
use crate::drivers::BLOCK_DEVICE;
use crate::fat32::fs::FAT32FileSystem;
use crate::fs::AT_FDCWD;
use crate::mutex::SpinNoIrqLock;
use crate::task::current_task;
use crate::SyscallRet;
use alloc::boxed::Box;
use alloc::sync::Arc;
use alloc::vec::Vec;
use bitflags::*;
use lazy_static::*;
/// A wrapper around a filesystem inode
/// to implement File trait atop
pub struct OSInode {
    readable: bool,
    writable: bool,
    inner: SpinNoIrqLock<OSInodeInner>,
}
/// The OS inode inner in 'UPSafeCell'
pub struct OSInodeInner {
    offset: usize,
    inode: Arc<dyn Inode>,
}

impl OSInode {
    fn get_offset(&self) -> usize {
        self.inner.lock().offset
    }

    pub fn set_offset(&self, offset: usize) {
        self.inner.lock().offset = offset;
    }

    pub fn inner_handler<T>(&self, f: impl FnOnce(&mut OSInodeInner) -> T) -> T {
        f(&mut self.inner.lock())
    }

    pub fn get_path(&self) -> Path {
        self.inner_handler(|inner| inner.inode.get_meta().path.clone())
    }
}

impl OSInode {
    /// Construct an OS inode from a inode
    pub fn new(readable: bool, writable: bool, inode: Arc<dyn Inode>) -> Self {
        Self {
            readable,
            writable,
            inner: SpinNoIrqLock::new(OSInodeInner { offset: 0, inode }),
        }
    }
    /// Read all data inside a inode into vector
    pub async fn read_all(&self) -> Vec<u8> {
        let inode = self.inner_handler(|inner| inner.inode.clone());
        let mut buffer = [0u8; 512];
        let mut v: Vec<u8> = Vec::new();
        loop {
            let offset = self.get_offset();
            let len = inode.read(offset, &mut buffer).await;
            let len = len.unwrap();
            if len == 0 {
                break;
            }
            self.set_offset(offset + len);
            v.extend_from_slice(&buffer[..len]);
        }
        v
    }
}

lazy_static! {
    pub static ref ROOT_INODE: Arc<dyn Inode> = {
        FAT32FileSystem::open(BLOCK_DEVICE.clone())
            .lock()
            .root_inode()
    };
}
/// List all files in the filesystems
pub fn list_apps() {
    // println!("/**** ROOT APPS ****");
    println!("[kernel] ROOT FILES >>>");
    for app in ROOT_INODE.list(ROOT_INODE.clone()).unwrap() {
        print!("{} \t", app.get_name());
    }
    println!("");
    // println!("**************/");
}

bitflags! {
    ///Open file flags
    pub struct OpenFlags: u32 {
        const APPEND = 1 << 10;
        const ASYNC = 1 << 13;
        const DIRECT = 1 << 14;
        const DSYNC = 1 << 12;
        const EXCL = 1 << 7;
        const NOATIME = 1 << 18;
        const NOCTTY = 1 << 8;
        const NOFOLLOW = 1 << 17;
        const PATH = 1 << 21;
        /// TODO: need to find 1 << 15
        const TEMP = 1 << 15;
        /// Read only
        const RDONLY = 0;
        /// Write only
        const WRONLY = 1 << 0;
        /// Read & Write
        const RDWR = 1 << 1;
        /// Allow create
        const CREATE = 1 << 6;
        /// Clear file and return an empty one
        const TRUNC = 1 << 9;
        /// Directory
        const DIRECTORY = 1 << 16;
        /// Enable the close-on-exec flag for the new file descriptor
        const CLOEXEC = 1 << 19;
        /// When possible, the file is opened in nonblocking mode
        const NONBLOCK = 1 << 11;
    }
}

impl OpenFlags {
    /// Do not check validity for simplicity
    /// Return (readable, writable)
    pub fn read_write(&self) -> (bool, bool) {
        if self.is_empty() {
            (true, false)
        } else if self.contains(Self::WRONLY) {
            (false, true)
        } else {
            (true, true)
        }
    }
}

fn open_cwd(dirfd: isize, path: &Path) -> SysResult<Arc<dyn Inode>> {
    if !path.is_relative() {
        // absolute path
        Ok(ROOT_INODE.clone())
    } else if dirfd == AT_FDCWD {
        // relative to cwd
        let task = current_task().unwrap();
        let cwd = &task.inner_lock().cwd;
        ROOT_INODE.open_path(cwd, false, false)
    } else {
        // relative to dirfd
        let task = current_task().unwrap();
        // let ret = task.inner_lock().fd_table[dirfd as usize]
        //     .clone()
        //     .unwrap()
        //     .get_meta()
        //     .inode
        //     .unwrap();
        // ret
        let ret = task
            .inner_lock()
            .fd_table
            .get(dirfd as usize)
            .map_or(Err(1), |fdinfo| {
                fdinfo
                    .file
                    .get_meta()
                    .inode
                    .map_or(Err(1), |inode| Ok(inode))
            });
        ret
    }
}

pub fn open_inode(dirfd: isize, path: &Path, flags: OpenFlags) -> SysResult<Arc<dyn Inode>> {
    // match open_cwd(dirfd, path).open_path(path, flags.contains(OpenFlags::CREATE), false) {
    //     Ok(inode) => {
    //         if flags.contains(OpenFlags::TRUNC) {
    //             inode.clear();
    //         }
    //         Ok(inode)
    //     }
    //     Err(e) => Err(e),
    // }
    open_cwd(dirfd, path).and_then(|cwd| {
        cwd.open_path(path, flags.contains(OpenFlags::CREATE), false)
            .and_then(|inode| {
                if flags.contains(OpenFlags::TRUNC) {
                    inode.clear();
                }
                Ok(inode)
            })
    })
}

pub fn open_file(dirfd: isize, path: &Path, flags: OpenFlags) -> SysResult<Arc<OSInode>> {
    let (readable, writable) = flags.read_write();
    match open_inode(dirfd, path, flags) {
        Ok(inode) => Ok(Arc::new(OSInode::new(readable, writable, inode))),
        Err(e) => Err(e),
    }
}

pub fn create_dir(dirfd: isize, path: &Path) -> SyscallRet {
    // match open_cwd(dirfd, path).open_path(path, false, true) {
    //     Ok(_) => Ok(0),
    //     Err(e) => Err(e),
    // }
    open_cwd(dirfd, path).and_then(|cwd| cwd.open_path(path, false, true).and_then(|_| Ok(0)))
}

impl File for OSInode {
    fn readable(&self) -> bool {
        self.readable
    }
    fn writable(&self) -> bool {
        self.writable
    }
    fn read<'a>(&'a self, buf: &'a mut [u8]) -> AsyncResult<usize> {
        Box::pin(async move {
            let inode = self.inner_handler(|inner| inner.inode.clone());
            let offset = self.get_offset();
            let read_size = inode.read(offset, buf).await;
            self.set_offset(offset + read_size.unwrap());
            Ok(read_size.unwrap())
        })
    }
    fn write<'a>(&'a self, buf: &'a [u8]) -> AsyncResult<usize> {
        Box::pin(async move {
            // let mut total_write_size = 0;
            let inode = self.inner_handler(|inner| inner.inode.clone());
            // for slices in buf.buffers.iter() {
            // let mut inner = self.inner.lock();
            let offset = self.get_offset();
            let write_size = inode.write(offset, buf).await;
            // inner.offset += write_size.unwrap();
            self.set_offset(offset + write_size.unwrap());
            // total_write_size += write_size.unwrap();
            // inner droped here
            // }
            Ok(write_size.unwrap())
        })
    }

    fn get_meta(&self) -> FileMeta {
        let inode = self.inner.lock().inode.clone();
        let offset = self.inner_handler(|inner| inner.offset);
        FileMeta::new(Some(inode), offset)
    }

    fn seek(&self, offset: usize) {
        self.inner_handler(|inner| inner.offset = offset);
    }
}
