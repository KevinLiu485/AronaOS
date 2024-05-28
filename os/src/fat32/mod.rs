//! fat32 file system

#![allow(unused)]
#![allow(dead_code)]

use crate::mutex::SpinNoIrqLock;

mod block_cache;
pub mod block_dev;
mod dentry;
mod fat;
mod file;
pub mod fs;
pub mod inode;
mod layout;
mod time;

pub type FSMutex<T> = SpinNoIrqLock<T>;

const BLOCK_SIZE: usize = 512;
const SECTOR_SIZE: usize = 512;
const BLOCK_CACHE_SIZE: usize = 16;
const SNAME_LEN: usize = 11;
const LNAME_MAXLEN: usize = 256;
const BOOT_SECTOR_ID: usize = 0;
const FATENTRY_PER_SECTOR: usize = 128;
const FATENTRY_MASK: u32 = 0x0FFFFFFF;
const FATENTRY_MIN_EOC: u32 = 0x0FFFFFF8;
const FATENTRY_EOC: u32 = 0x0FFFFFFF;
const FSI_LEADSIG: u32 = 0x41615252;
const FSI_STRUCSIG: u32 = 0x61417272;
const FSI_TRAILSIG: u32 = 0xAA550000;
const FSI_RESERVED1_SIZE: usize = 480;
const FSI_RESERVED2_SIZE: usize = 12;
const FSI_NOT_AVAILABLE: u32 = 0xFFFFFFFF;
