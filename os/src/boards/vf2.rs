//! This is config for board Vision Five 2

use crate::KERNEL_BASE;

/// u-boot should load fs img into this physical addr
/// e.g. `fatload mmc 1:1 0xa0000000 sdcard.img`
const VF2_RAMFS_BASE_PA: usize = 0xa000_0000;
/// virt addr of ram fs
pub const VF2_RAMFS_BASE: usize = VF2_RAMFS_BASE_PA + KERNEL_BASE;
/// size of ram fs
// pub const VF2_RAMFS_SIZE: usize = 0x8000_0000; // 2GB
pub const VF2_RAMFS_SIZE: usize = 0x1000_0000; // 2GB
