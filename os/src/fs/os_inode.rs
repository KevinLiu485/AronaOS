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
use crate::mm::UserBuffer;
use crate::mutex::SpinNoIrqLock;
use alloc::boxed::Box;
use alloc::sync::Arc;
use alloc::vec::Vec;
// use alloc::vec;
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
        // let mut inner = self.inner.lock();
        // let inode = inner.inode.clone();
        // let inode = self.inner.lock().inode.clone();
        let inode = self.inner_handler(|inner| inner.inode.clone());
        let mut buffer = [0u8; 512];
        let mut v: Vec<u8> = Vec::new();
        loop {
            let offset = self.get_offset();
            // let offset = self.inner_handler(|inner| inner.offset);
            let len = inode.read(offset, &mut buffer).await;
            let len = len.unwrap();
            if len == 0 {
                break;
            }
            // inner.offset += len;
            self.set_offset(offset + len);
            // self.inner_handler(|inner| inner.offset += len);
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
            // ROOT_INODE
            //     .create(name)
            //     .map(|inode| Arc::new(OSInode::new(readable, writable, inode)))
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
    fn read(&self, mut buf: UserBuffer) -> AsyncResult<usize> {
        // let mut inner = self.inner.exclusive_access();
        // let mut total_read_size = 0usize;
        // for slice in buf.buffers.iter_mut() {
        //     let read_size = inner.inode.read(inner.offset, *slice);
        //     if read_size == 0 {
        //         break;
        //     }
        //     inner.offset += read_size;
        //     total_read_size += read_size;
        // }
        // total_read_size

        // Box::pin(async move {
        //     let _sum_guard = SumGuard::new();
        //     let info =
        //         "nodev\ttmpfs\n".to_owned() + "nodev\tproc\n" + "nodev\tdevtmpfs\n" + "\tvfat\n";
        //     let len = info.len();
        //     let mut inner = self.metadata().inner.lock();
        //     if inner.pos == len {
        //         debug!("[MountFile] already read");
        //         Ok(0)
        //     } else {
        //         buf[..len].copy_from_slice(info.as_bytes());
        //         inner.pos = len;
        //         Ok(len)
        //     }
        // })
        Box::pin(async move {
            let mut total_read_size = 0;
            let inode = self.inner_handler(|inner| inner.inode.clone());
            for slices in buf.buffers.iter_mut() {
                // let mut inner = self.inner.lock();
                let offset = self.get_offset();
                let read_size = inode.read(offset, *slices).await;
                // inner.offset += read_size.unwrap();
                self.set_offset(offset + read_size.unwrap());
                total_read_size += read_size.unwrap();
                // inner droped here
            }
            Ok(total_read_size)
        })
    }
    fn write(&self, buf: UserBuffer) -> AsyncResult<usize> {
        // let mut inner = self.inner.exclusive_access();
        // let mut total_write_size = 0usize;
        // for slice in buf.buffers.iter() {
        //     let write_size = inner.inode.write_at(inner.offset, *slice);
        //     assert_eq!(write_size, slice.len());
        //     inner.offset += write_size;
        //     total_write_size += write_size;
        // }
        // total_write_size
        Box::pin(async move {
            let mut total_write_size = 0;
            let inode = self.inner_handler(|inner| inner.inode.clone());
            for slices in buf.buffers.iter() {
                // let mut inner = self.inner.lock();
                let offset = self.get_offset();
                let write_size = inode.write(offset, *slices).await;
                // inner.offset += write_size.unwrap();
                self.set_offset(offset + write_size.unwrap());
                total_write_size += write_size.unwrap();
                // inner droped here
            }
            Ok(total_write_size)
        })
    }
}
