use alloc::sync::Arc;
// use easy_fs::BlockDevice;
use lazy_static::lazy_static;
use log::debug;

use crate::{drivers::BLOCK_DEVICE, mutex::SpinLock};

use super::{
    block_cache::get_block_cache, block_dev::BlockDevice, fat::FAT32FileAllocTable, inode::Inode, layout::{FAT32BootSector, FAT32FSInfoSector, BLOCK_SIZE}
};

pub struct FAT32FileSystem {
    pub block_device: Arc<dyn BlockDevice>,
    pub fs_fat: Arc<SpinLock<FAT32FileAllocTable>>,
    pub fs_meta: FAT32Meta,
    pub fs_info: FAT32Info,
}

impl FAT32FileSystem {
    pub fn open(block_device: Arc<dyn BlockDevice>) -> Arc<SpinLock<Self>> {
        let fs_meta = get_block_cache(0, block_device.clone()).lock().read(
            0,
            |boot_sector: &FAT32BootSector| {
                debug!("FAT32FileSystem::open(): boot_sector: {:?}", boot_sector);
                assert!(
                    boot_sector.is_valid(),
                    "FAT32FileSystem::open(): Error loading boot_sector!"
                );
                FAT32Meta::new(boot_sector)
            },
        );
        let fs_info = get_block_cache(fs_meta.fs_info_sector_id, block_device.clone())
            .lock()
            .read(0, |fs_info_sector: &FAT32FSInfoSector| {
                debug!(
                    "FAT32FileSystem::open(): fs_info_sector: {:?}",
                    fs_info_sector
                );
                assert!(
                    fs_info_sector.is_valid(),
                    "FAT32FileSystem::open(): Error loading fs_info_sector!"
                );
                FAT32Info::new(fs_info_sector)
            });
        
        Arc::new(SpinLock::new(Self {
            block_device,
            fs_meta,
            fs_info,
        }))
    }

    pub fn root_inode(fs: &Arc<SpinLock<FAT32FileSystem>>) -> Inode {
        todo!()
    }
}

/// immutable struct, initialized at open
/// in-memory struct of FAT32BootSector
struct FAT32Meta {
    // bytes_per_sector: hardwired `512` for simplicity, the same as blocksize
    sector_per_cluster: usize,

    fat_count: usize, // count of FAT
    total_sector_count: usize,
    fat_sector_count: usize, // sector count of ONE FAT

    root_cluster_id: usize,
    fs_info_sector_id: usize,
    backup_sector_id: usize,
}

impl FAT32Meta {
    pub fn new(boot_sector: &FAT32BootSector) -> Self {
        Self {
            sector_per_cluster: boot_sector.BPB_SectorPerCluster as usize,
            fat_count: boot_sector.BPB_NumFATs as usize,
            total_sector_count: boot_sector.BPB_TotSector32 as usize,
            fat_sector_count: boot_sector.BPB_FATsize32 as usize,
            root_cluster_id: boot_sector.BPB_RootCluster as usize,
            fs_info_sector_id: boot_sector.BPB_FSInfo as usize,
            backup_sector_id: boot_sector.BPB_BkBootSec as usize,
        }
    }
}

/// mutable struct, update along read and write
/// in-memory struct of FAT32FSInfoSector
struct FAT32Info {
    free_cluster_count: usize,
    next_free_cluster: usize,
}

impl FAT32Info {
    pub fn new(fs_info_sector: &FAT32FSInfoSector) -> Self {
        Self {
            free_cluster_count: fs_info_sector.FSI_Free_Count as usize,
            next_free_cluster: fs_info_sector.FSI_Nxt_Free as usize,
        }
    }
}
