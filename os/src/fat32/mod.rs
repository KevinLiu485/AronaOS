//! fat32 file system

#![allow(unused)]
#![allow(dead_code)]

use self::fs::FAT32FS;

mod block_cache;
mod block_dev;
mod fs;
mod layout;

/// Initialize the FAT32 file system
pub fn init() {
    FAT32FS.lock().debug();
}
