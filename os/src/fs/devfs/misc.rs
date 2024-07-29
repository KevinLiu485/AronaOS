use core::panic;

use alloc::sync::Arc;

use crate::{
    fs::inode::{Inode, InodeMeta, InodeMode},
    AsyncResult, SysResult,
};

use super::rtc::RtcInode;

// use super::tty::TtyInode;

pub struct MiscInode {
    meta: Arc<InodeMeta>,
}

impl MiscInode {
    pub fn new(parent: Arc<dyn Inode>) -> Self {
        let meta = Arc::new(InodeMeta::new(
            Some(parent.clone()),
            "/dev/misc".into(),
            InodeMode::FileDIR,
            0,
            0,
        ));
        Self { meta }
    }
}

impl Inode for MiscInode {
    fn read<'a>(&'a self, _offset: usize, _buf: &'a mut [u8]) -> AsyncResult<usize> {
        panic!("[MiscInode::read] invalid");
    }
    fn write<'a>(&'a self, _offset: usize, _buf: &'a [u8]) -> AsyncResult<usize> {
        panic!("[MiscInode::write] invalid");
    }
    fn mknod(
        &self,
        _this: Arc<dyn Inode>,
        _name: &str,
        _mode: InodeMode,
    ) -> SysResult<Arc<dyn Inode>> {
        panic!("[MiscInode::mknod] invalid");
    }
    fn get_meta(&self) -> Arc<InodeMeta> {
        self.meta.clone()
    }
    fn load_children_from_disk(&self, this: Arc<dyn Inode>) {
        let meta = self.meta.clone();
        let mut meta_inner = meta.inner.lock();
        let rtc: Arc<dyn Inode> = Arc::new(RtcInode::new(this));
        meta_inner.children.insert(rtc.get_name(), rtc);
    }
    fn clear(&self) {
        panic!("[MiscInode::clear] invalid");
    }
}
