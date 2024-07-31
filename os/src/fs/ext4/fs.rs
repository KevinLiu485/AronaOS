use alloc::sync::Arc;
use ext4_rs::Ext4;
use log::info;

use crate::{
    fs::{
        ext4::EXT4_ROOT_INO,
        inode::{Inode, InodeMeta, InodeMode},
        path::Path,
    },
    mutex::SpinNoIrqLock,
};

use super::inode::Ext4Inode;

// fn open_ext4(block_device: Arc<dyn ext4_rs::BlockDevice>) -> Ext4 {
//     let ext4 = Ext4::open(block_device);
// info!(
//     "[open_ext4] ext4 opened. block_size: {}, version: {}.{}",
//     1024 * (1 << ext4.super_block.log_block_size),
//     ext4.super_block.rev_level,
//     ext4.super_block.minor_rev_level
// );
// // hardwired 4096 B
// assert!(ext4.super_block.log_block_size == 2);
//     ext4
// }

pub struct Ext4FileSystem {
    pub block_device: Arc<dyn ext4_rs::BlockDevice>,
    pub root_inode: Arc<dyn Inode>,
}

impl Ext4FileSystem {
    pub fn open(block_device: Arc<dyn ext4_rs::BlockDevice>) -> Arc<SpinNoIrqLock<Self>> {
        // let ext4 = open_ext4(block_device.clone());
        let ext4 = Ext4::open(block_device.clone());
        let root_inode = Arc::new(Ext4Inode::new(
            // Arc::new(ext4),
            ext4,
            Arc::new(InodeMeta::new(
                None,
                Path::root(),
                InodeMode::FileDIR,
                0,
                EXT4_ROOT_INO,
            )),
        ));
        Arc::new(SpinNoIrqLock::new(Ext4FileSystem {
            block_device,
            root_inode,
        }))
    }

    pub fn root_inode(&self) -> Arc<dyn Inode> {
        self.root_inode.clone()
    }
}
