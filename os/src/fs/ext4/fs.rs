use alloc::sync::Arc;
use ext4_rs::Ext4;
use log::info;

pub fn open_ext4(block_device: Arc<dyn ext4_rs::BlockDevice>) -> Ext4 {
    let ext4 = Ext4::open(block_device);
    info!(
        "[open_ext4] ext4 opened. block_size: {}, version: {}.{}",
        1024 * (1 << ext4.super_block.log_block_size),
        ext4.super_block.rev_level,
        ext4.super_block.minor_rev_level
    );
    // hardwired 4096 B
    assert!(ext4.super_block.log_block_size == 2);
    ext4
}
