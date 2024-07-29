use core::panic;

use alloc::{boxed::Box, sync::Arc};

use crate::{
    fs::inode::{Inode, InodeMeta, InodeMode},
    AsyncResult, SysResult,
};

pub struct NullInode {
    meta: Arc<InodeMeta>,
}

impl NullInode {
    pub fn new(parent: Arc<dyn Inode>) -> Self {
        let meta = Arc::new(InodeMeta::new(
            Some(parent.clone()),
            "/dev/null".into(),
            InodeMode::FileREG,
            0,
            0,
        ));
        Self { meta }
    }
}

impl Inode for NullInode {
    fn read<'a>(&'a self, _offset: usize, _buf: &'a mut [u8]) -> AsyncResult<usize> {
        Box::pin(async move { Ok(0) })
    }
    fn write<'a>(&'a self, _offset: usize, _buf: &'a [u8]) -> AsyncResult<usize> {
        Box::pin(async move { Ok(_buf.len()) })
    }
    fn mknod(
        &self,
        _this: Arc<dyn Inode>,
        _name: &str,
        _mode: InodeMode,
    ) -> SysResult<Arc<dyn Inode>> {
        panic!("[NullInode::mknod] invalid");
    }
    fn get_meta(&self) -> Arc<InodeMeta> {
        self.meta.clone()
    }
    fn load_children_from_disk(&self, _this: Arc<dyn Inode>) {
        panic!("[NullInode::load_children_from_disk] invalid");
    }
    fn clear(&self) {
        panic!("[NullInode::clear] invalid");
    }
}
