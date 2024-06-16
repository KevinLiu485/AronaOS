//! File system in os
pub mod ctypes;
pub mod inode;
mod os_inode;
pub mod path;
pub mod pipe;
mod stdio;

pub use ctypes::*;

use crate::{
    config::AsyncResult,
    timer::TimeSpec,
    // mm::UserBuffer,
};

pub struct FileMeta {
    pub inode: Option<Arc<dyn Inode>>,
    pub offset: usize,
}

impl FileMeta {
    pub fn new(inode: Option<Arc<dyn Inode>>, offset: usize) -> Self {
        Self { inode, offset }
    }
}

/// File trait
pub trait File: Send + Sync {
    /// If readable
    fn readable(&self) -> bool;
    /// If writable
    fn writable(&self) -> bool;
    /// Read file to `UserBuffer`
    fn read<'a>(&'a self, buf: &'a mut [u8]) -> AsyncResult<usize>;
    /// Write `UserBuffer` to file
    fn write<'a>(&'a self, buf: &'a [u8]) -> AsyncResult<usize>;

    fn get_meta(&self) -> FileMeta;

    fn seek(&self, offset: usize);
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

pub const AT_FDCWD: isize = -100;
pub const AT_REMOVEDIR: u32 = 0x200;

use alloc::sync::Arc;
use inode::Inode;
// use alloc::sync::Arc;
pub use os_inode::{create_dir, list_apps, open_file, open_inode, OSInode, OpenFlags};
pub use stdio::{Stdin, Stdout};
