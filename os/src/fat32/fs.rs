use alloc::sync::Arc;
use easy_fs::BlockDevice;
use lazy_static::lazy_static;
use log::debug;

use crate::{drivers::BLOCK_DEVICE, mutex::SpinLock};

use super::{
    block_cache::get_block_cache,
    layout::{FAT32BootSector, FAT32FSInfoSector, BLOCK_SIZE},
};

lazy_static! {
    pub static ref FAT32FS: Arc<SpinLock<FAT32FileSystem>> =
        { FAT32FileSystem::open(BLOCK_DEVICE.clone()) };
}
pub struct FAT32FileSystem {
    pub block_device: Arc<dyn BlockDevice>,
    pub boot_sector: FAT32BootSector,
}

impl FAT32FileSystem {
    pub fn open(block_device: Arc<dyn BlockDevice>) -> Arc<SpinLock<Self>> {
        get_block_cache(0, block_device.clone())
            .lock()
            .read(0, |boot_sector: &FAT32BootSector| {
                debug!("FAT32FileSystem::open(): boot_sector: {:?}", boot_sector);
                assert!(boot_sector.is_valid(), "Error loading FAT32!");
                Arc::new(SpinLock::new(Self {
                    block_device,
                    boot_sector: *boot_sector, // cloned
                }))
            })
    }

    pub fn debug(&self) {
        debug!(
            "FAT32FileSystem::debug(): boot_sector: {:?}",
            self.boot_sector
        );
    }
}
