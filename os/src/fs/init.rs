use alloc::sync::Arc;

use super::{
    devfs::dev::DevInode,
    inode::Inode,
    os_inode::{list_apps, ROOT_INODE},
    procfs::proc::ProcInode,
};

/// used on start of os
pub fn init() {
    mount_fs();
    list_apps();
}

fn mount_fs() {
    let root_meta = ROOT_INODE.get_meta();
    let mut root_inner = root_meta.inner.lock();

    // 'mount' inner fs es
    let dev: Arc<dyn Inode> = Arc::new(DevInode::new(ROOT_INODE.clone()));
    let proc: Arc<dyn Inode> = Arc::new(ProcInode::new(ROOT_INODE.clone()));
    root_inner.children.insert(dev.get_name(), dev.clone());
    root_inner.children.insert(proc.get_name(), proc.clone());
}
