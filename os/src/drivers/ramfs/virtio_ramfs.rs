use alloc::{sync::Arc, vec::Vec};
use lazy_static::lazy_static;

use crate::boards::vf2::VF2_RAMFS_BASE;

pub struct VirtIORamFS {
    base: usize,
}

impl VirtIORamFS {
    pub fn new(base: usize) -> Self {
        Self { base }
    }
}

impl ext4_rs::BlockDevice for VirtIORamFS {
    // read data from offset in byte, return a Vec<u8> with length of ext4_rs::BLOCK_SIZE(4096 B)
    fn read_offset(&self, offset: usize) -> Vec<u8> {
        log::debug!("[VirtIORamFS::read_offset] offset: {:#x}", offset);
        let start_addr = self.base + offset;
        let block_size = ext4_rs::BLOCK_SIZE;
        unsafe {
            let slice = core::slice::from_raw_parts(start_addr as *const u8, block_size);
            slice.to_vec()
        }
        // log::debug!("[VirtIORamFS::read_offset] ok");
    }

    // write all data to offset
    fn write_offset(&self, offset: usize, data: &[u8]) {
        let start_addr = self.base + offset;
        unsafe {
            let slice = core::slice::from_raw_parts_mut(start_addr as *mut u8, data.len());
            slice.copy_from_slice(data);
        }
    }
}

lazy_static! {
    pub static ref VIRTIO_RAMFS: Arc<VirtIORamFS> = Arc::new(VirtIORamFS::new(VF2_RAMFS_BASE));
}
