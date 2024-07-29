use alloc::{boxed::Box, sync::Arc};

use crate::{
    fs::inode::{Inode, InodeMeta, InodeMode},
    AsyncResult, SysResult,
};

/// faked /proc/mounts, nothing to read.
pub struct MountsInode {
    meta: Arc<InodeMeta>,
    // content: String,
}

impl MountsInode {
    pub fn new(parent: Arc<dyn Inode>) -> Self {
        let meta = Arc::new(InodeMeta::new(
            Some(parent),
            "/proc/mounts".into(),
            InodeMode::FileREG,
            0,
            0,
        ));
        Self {
            meta,
            // content: "".into(),
        }
    }
}

impl Inode for MountsInode {
    fn read<'a>(&'a self, _offset: usize, _buf: &'a mut [u8]) -> AsyncResult<usize> {
        Box::pin(async move { Ok(0) })
    }
    fn write<'a>(&'a self, _offset: usize, _buf: &'a [u8]) -> AsyncResult<usize> {
        panic!("[MountsInode::write] invalid")
    }
    fn mknod(
        &self,
        _this: Arc<dyn Inode>,
        _name: &str,
        _mode: InodeMode,
    ) -> SysResult<Arc<dyn Inode>> {
        panic!("[MountsInode::mknod] invalid")
    }
    fn get_meta(&self) -> Arc<InodeMeta> {
        self.meta.clone()
    }
    fn load_children_from_disk(&self, _this: Arc<dyn Inode>) {
        panic!("[MountsInode::load_children_from_disk] invalid")
    }
    fn clear(&self) {
        panic!("[MountsInode::clear] invalid")
    }
}
