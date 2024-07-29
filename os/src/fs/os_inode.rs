//! `Arc<Inode>` -> `OSInodeInner`: In order to open files concurrently
//! we need to wrap `Inode` into `Arc`,but `Mutex` in `Inode` prevents
//! file systems from being accessed simultaneously
//!
//! `UPSafeCell<OSInodeInner>` -> `OSInode`: for static `ROOT_INODE`,we
//! need to wrap `OSInodeInner` into `UPSafeCell`
use super::inode::Inode;
use super::path::Path;
use super::{File, FileMeta, FileMetaInner};
use crate::config::{AsyncResult, SysResult};
#[allow(unused)]
use crate::drivers::block::EXT4_BLOCK_DEVICE;
use crate::drivers::BLOCK_DEVICE;
#[allow(unused)]
use crate::fs::ext4::fs::Ext4FileSystem;
use crate::fs::fat32::fs::FAT32FileSystem;
use crate::fs::AT_FDCWD;
// use crate::task::current_task;
use crate::task::processor::current_process;
use crate::utils::SyscallErr;
use crate::SyscallRet;
use alloc::boxed::Box;
use alloc::sync::Arc;
use alloc::vec::Vec;
use bitflags::*;
use lazy_static::*;
use log::{error, info};

/// A wrapper around a filesystem inode
/// to implement File trait atop
pub struct OSInode {
    // readable: bool,
    // writable: bool,
    // meta: SpinNoIrqLock<FileMeta>,
    meta: FileMeta,
}
/// The OS inode inner in 'UPSafeCell'
// pub struct OSInodeInner {
//     inode: Arc<dyn Inode>,
//     offset: usize,
//     dentry_index: usize,
// }

impl OSInode {
    fn get_offset(&self) -> usize {
        // self.meta.lock().offset
        self.meta.inner.lock().offset
    }

    fn set_offset(&self, offset: usize) {
        self.meta.inner.lock().offset = offset;
    }

    pub fn inner_handler<T>(&self, f: impl FnOnce(&mut FileMetaInner) -> T) -> T {
        f(&mut self.meta.inner.lock())
    }

    pub fn get_path(&self) -> Path {
        self.inner_handler(|inner| inner.inode.as_ref().unwrap().get_meta().path.clone())
        // self.inode.get_meta().path.clone()
    }
}

impl OSInode {
    /// Construct an OS inode from a inode
    pub fn new(readable: bool, writable: bool, inode: Arc<dyn Inode>) -> Self {
        Self {
            // readable,
            // writable,
            // meta: SpinNoIrqLock::new(FileMeta {
            //     inode: Some(inode),
            //     offset: 0,
            //     dentry_index: 0,
            // }),
            // meta: FileMeta {
            //     inner: SpinNoIrqLock::new(FileMetaInner {
            //         inode: Some(inode),
            //         offset: 0,
            //         dentry_index: 0,
            //     }),
            // },
            meta: FileMeta::new(Some(inode), 0, 0, readable, writable),
        }
    }
    /// Read all data inside a inode into vector
    pub async fn read_all(&self) -> Vec<u8> {
        let inode = self.inner_handler(|inner| inner.inode.clone()).unwrap();
        // let inode = self.inode.clone();
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

impl File for OSInode {
    // fn readable(&self) -> bool {
    //     self.readable
    // }
    // fn writable(&self) -> bool {
    //     self.writable
    // }
    fn read<'a>(&'a self, buf: &'a mut [u8]) -> AsyncResult<usize> {
        Box::pin(async move {
            if !self.meta.readable {
                return Err(SyscallErr::EBADF.into());
            }
            let inode = self.inner_handler(|inner| inner.inode.clone()).unwrap();
            let offset = self.get_offset();
            let read_size = inode.read(offset, buf).await?;
            self.set_offset(offset + read_size);
            Ok(read_size)
        })
    }
    fn write<'a>(&'a self, buf: &'a [u8]) -> AsyncResult<usize> {
        Box::pin(async move {
            // debug!("[OSInode::write] buf: {:?}", buf);
            if !self.meta.writable {
                return Err(SyscallErr::EBADF.into());
            }
            let inode = self.inner_handler(|inner| inner.inode.clone()).unwrap();
            let offset = self.get_offset();
            // let file_size = self.meta.inner.lock().inode.unwrap().get_meta().inner.lock().data_size;
            let write_size = inode.write(offset, buf).await?;
            self.set_offset(offset + write_size);
            Ok(write_size)
        })
    }

    fn get_meta(&self) -> &FileMeta {
        &self.meta
    }

    fn seek(&self, offset: usize) -> Option<usize> {
        self.inner_handler(|inner| {
            let ret = inner.offset;
            inner.offset = offset;
            Some(ret)
        })
        // self.set_offset(offset);
    }
    fn ioctl(&self, _request: usize, _argp: usize) -> SyscallRet {
        error!("[OSInode] ioctl not implemented");
        Err(SyscallErr::ENOTTY as usize)
    }
}

#[cfg(not(feature = "ext4"))]
lazy_static! {
    pub static ref ROOT_INODE: Arc<dyn Inode> = {
        info!("FS type: fat32");
        FAT32FileSystem::open(BLOCK_DEVICE.clone())
            .unwrap()
            .lock()
            .root_inode()
    };
}

#[cfg(feature = "ext4")]
lazy_static! {
    pub static ref ROOT_INODE: Arc<dyn Inode> = {
        info!("FS type: ext4");
        Ext4FileSystem::open(EXT4_BLOCK_DEVICE.clone())
            .lock()
            .root_inode()
    };
}

/// List all files in the filesystems
pub fn list_apps() {
    // println!("/**** ROOT APPS ****");
    println!("[kernel] ROOT FILES >>>");
    for app in ROOT_INODE.list().unwrap() {
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
        let process = current_process();
        let cwd = &process.inner_lock().cwd;
        ROOT_INODE.open_path(cwd, false, false)
    } else {
        // relative to dirfd
        let task = current_process();
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
                    .inner
                    .lock()
                    .inode
                    .clone()
                    .map_or(Err(1), |inode| Ok(inode))
            });
        ret
    }
}

/// Open a inode by `dirfd` and `path`
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

/// Open a OSInode by `dirfd` and `path`
pub fn open_osinode(dirfd: isize, path: &Path, flags: OpenFlags) -> SysResult<Arc<OSInode>> {
    let (readable, writable) = flags.read_write();
    match open_inode(dirfd, path, flags) {
        Ok(inode) => Ok(Arc::new(OSInode::new(readable, writable, inode))),
        Err(e) => Err(e),
    }
}

/// open a `dyn File` by `fd`
/// as `Err` differs from different syscalls(e.g. `read` and `sendfile`), only return `Option` rather than `Result`.
pub fn open_fd(fd: usize) -> Option<Arc<dyn File>> {
    let fdinfo = current_process().inner_handler(|inner| inner.fd_table.get(fd))?;
    let file = fdinfo.file;
    // .get_meta()
    // .inode
    // .ok_or(SyscallErr::EBADF as usize)?;
    Some(file)
}

/// Create a directory by `dirfd` and `path`
pub fn create_dir(dirfd: isize, path: &Path) -> SyscallRet {
    // match open_cwd(dirfd, path).open_path(path, false, true) {
    //     Ok(_) => Ok(0),
    //     Err(e) => Err(e),
    // }
    // open_cwd(dirfd, path).and_then(|cwd| cwd.open_path(path, false, true).and_then(|_| Ok(0)))
    let cwd_inode = open_cwd(dirfd, path)?;
    cwd_inode.open_path(path, false, true).map(|_| 0)
}
