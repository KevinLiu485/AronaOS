//! `Arc<Inode>` -> `OSInodeInner`: In order to open files concurrently
//! we need to wrap `Inode` into `Arc`,but `Mutex` in `Inode` prevents
//! file systems from being accessed simultaneously
//!
//! `UPSafeCell<OSInodeInner>` -> `OSInode`: for static `ROOT_INODE`,we
//! need to wrap `OSInodeInner` into `UPSafeCell`
use super::inode::{Inode, InodeMode};
use super::File;
use crate::config::{AsyncResult, SysResult};
use crate::drivers::BLOCK_DEVICE;
use crate::fat32::fs::FAT32FileSystem;
// use crate::mm::UserBuffer;
use crate::mutex::SpinNoIrqLock;
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

    fn set_offset(&self, offset: usize) {
        self.inner.lock().offset = offset;
    }

    pub fn inner_handler<T>(&self, f: impl FnOnce(&mut OSInodeInner) -> T) -> T {
        f(&mut self.inner.lock())
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
    println!("/**** ROOT APPS ****");
    for app in ROOT_INODE.list(ROOT_INODE.clone()).unwrap() {
        println!("{}", app.get_name());
    }
    println!("**************/");
}

bitflags! {
    ///Open file flags
    pub struct OpenFlags: u32 {
        ///Read only
        const RDONLY = 0;
        ///Write only
        const WRONLY = 1 << 0;
        ///Read & Write
        const RDWR = 1 << 1;
        ///Allow create
        const CREATE = 1 << 9;
        ///Clear file and return an empty one
        const TRUNC = 1 << 10;
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
///Open file with flags
pub fn open_file(name: &str, flags: OpenFlags) -> SysResult<Arc<OSInode>> {
    let (readable, writable) = flags.read_write();
    if flags.contains(OpenFlags::CREATE) {
        if let Ok(inode) = ROOT_INODE.find(ROOT_INODE.clone(), name) {
            // clear size
            // inode.clear();
            Ok(Arc::new(OSInode::new(readable, writable, inode)))
        } else {
            // create file
            ROOT_INODE
                .mknod_v(name, InodeMode::FileREG)
                .map(|inode| Arc::new(OSInode::new(readable, writable, inode)))
        }
    } else {
        ROOT_INODE.find(ROOT_INODE.clone(), name).map(|inode| {
            if flags.contains(OpenFlags::TRUNC) {
                inode.clear();
            }
            Arc::new(OSInode::new(readable, writable, inode))
        })
    }
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
            // let mut total_read_size = 0;
            let inode = self.inner_handler(|inner| inner.inode.clone());
            // for slices in buf.buffers.iter_mut() {
            // let mut inner = self.inner.lock();
            let offset = self.get_offset();
            let read_size = inode.read(offset, buf).await;
            // inner.offset += read_size.unwrap();
            self.set_offset(offset + read_size.unwrap());
            // total_read_size += read_size.unwrap();
            // inner droped here
            // }
            // Ok(total_read_size)
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
}
