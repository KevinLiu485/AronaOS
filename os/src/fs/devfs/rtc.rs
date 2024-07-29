use core::panic;

use alloc::{boxed::Box, sync::Arc};

use crate::{
    fs::inode::{Inode, InodeMeta, InodeMode},
    AsyncResult, SysResult,
};

// use super::tty::TtyInode;

pub struct RtcInode {
    meta: Arc<InodeMeta>,
}

impl RtcInode {
    pub fn new(parent: Arc<dyn Inode>) -> Self {
        let meta = Arc::new(InodeMeta::new(
            Some(parent.clone()),
            "/dev/misc/rtc".into(),
            InodeMode::FileREG,
            0,
            0,
        ));
        Self { meta }
    }
}

impl Inode for RtcInode {
    fn read<'a>(&'a self, _offset: usize, _buf: &'a mut [u8]) -> AsyncResult<usize> {
        // panic!("[RtcInode::read] invalid");
        Box::pin(async move { Ok(0) })
    }
    fn write<'a>(&'a self, _offset: usize, _buf: &'a [u8]) -> AsyncResult<usize> {
        panic!("[RtcInode::write] invalid");
    }
    fn mknod(
        &self,
        _this: Arc<dyn Inode>,
        _name: &str,
        _mode: InodeMode,
    ) -> SysResult<Arc<dyn Inode>> {
        panic!("[RtcInode::mknod] invalid");
    }
    fn get_meta(&self) -> Arc<InodeMeta> {
        self.meta.clone()
    }
    fn load_children_from_disk(&self, _this: Arc<dyn Inode>) {
        panic!("[RtcInode::load_children_from_disk] invalid");
    }
    fn clear(&self) {
        panic!("[RtcInode::clear] invalid");
    }
}
