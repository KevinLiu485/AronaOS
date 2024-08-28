use alloc::sync::Arc;

use crate::{
    fs::{
        inode::{Inode, InodeMeta, InodeMode},
        tty::TTY,
        File,
    },
    AsyncResult, SysResult,
};

pub struct TtyInode {
    meta: Arc<InodeMeta>,
}

impl TtyInode {
    pub fn new(parent: Arc<dyn Inode>) -> Self {
        let meta = Arc::new(InodeMeta::new(
            Some(parent),
            "/dev/tty".into(),
            InodeMode::FileCHR,
            0,
            0,
        ));
        Self { meta }
    }
}

impl Inode for TtyInode {
    fn read<'a>(&'a self, _offset: usize, buf: &'a mut [u8]) -> AsyncResult<usize> {
        TTY.read(buf)
    }
    fn write<'a>(&'a self, _offset: usize, buf: &'a [u8]) -> AsyncResult<usize> {
        TTY.write(buf)
    }
    fn mknod(
        &self,
        _this: Arc<dyn Inode>,
        _name: &str,
        _mode: InodeMode,
    ) -> SysResult<Arc<dyn Inode>> {
        panic!("[TtyInode::mknod] invalid")
    }
    fn get_meta(&self) -> Arc<InodeMeta> {
        self.meta.clone()
    }
    fn load_children_from_disk(&self, _this: Arc<dyn Inode>) {
        panic!("[TtyInode::load_children_from_disk] invalid")
    }
    fn clear(&self) {
        panic!("[TtyInode::clear] invalid")
    }
}
