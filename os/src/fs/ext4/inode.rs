use crate::{
    fs::inode::{Inode, InodeMeta, InodeMode},
    AsyncResult, SysResult,
};
use alloc::{boxed::Box, sync::Arc};
use ext4_rs::Ext4;
use log::{debug, error};

pub struct Ext4Inode {
    fs: Arc<Ext4>,
    // ino: u64,
    meta: Arc<InodeMeta>,
}

impl Ext4Inode {
    pub fn new(fs: Arc<Ext4>, meta: Arc<InodeMeta>) -> Self {
        Self { fs, meta }
    }

    /// update the `data_size` of the inode from disk
    fn update_size(&self) {
        let size = self.get_size();
        self.meta.inner.lock().data_size = size;
    }

    fn get_size(&self) -> usize {
        self.fs
            .fuse_getattr(self.meta.ino as u64)
            .map_err(|ext4_err| {
                error!("[Ext4Inode::update_size] {:?}", ext4_err);
                ext4_err.error() as usize
            })
            .unwrap()
            .size as usize
    }

    fn get_size_from_ino(fs: &Arc<Ext4>, ino: u64) -> usize {
        // debug!("[get_size_from_ino]");
        fs.fuse_getattr(ino as u64)
            .map_err(|ext4_err| {
                error!("[Ext4Inode::update_size] {:?}", ext4_err);
                ext4_err.error() as usize
            })
            .unwrap()
            .size as usize
    }
}

impl Inode for Ext4Inode {
    fn read<'a>(&'a self, offset: usize, buf: &'a mut [u8]) -> AsyncResult<usize> {
        Box::pin(async move {
            let data = self
                .fs
                .fuse_read(
                    self.meta.ino as u64,
                    0,
                    offset as i64,
                    buf.len() as u32,
                    0,
                    None,
                )
                .map_err(|ext4_err| {
                    error!("[Ext4Inode::read] {:?}", ext4_err);
                    ext4_err.error() as usize
                })?;
            buf[..data.len()].copy_from_slice(&data);
            Ok(data.len())
        })
    }
    fn write<'a>(&'a self, offset: usize, buf: &'a [u8]) -> AsyncResult<usize> {
        Box::pin(async move {
            let data = self
                .fs
                .fuse_write(self.meta.ino as u64, 0, offset as i64, buf, 0, 0, None)
                .map_err(|ext4_err| {
                    error!("[Ext4Inode::write] {:?}", ext4_err);
                    ext4_err.error() as usize
                })?;
            self.update_size();
            Ok(data as usize)
        })
    }
    fn mknod(
        &self,
        this: Arc<dyn Inode>,
        name: &str,
        mode: InodeMode,
    ) -> SysResult<Arc<dyn Inode>> {
        if self.meta.mode != InodeMode::FileDIR {
            return Err(1);
        }
        let new_inode_ref = if mode == InodeMode::FileDIR {
            self.fs
                .fuse_mkdir(self.meta.ino as u64, name, mode as u32, 0)
                .map_err(|ext4_err| {
                    error!("[Ext4Inode::mknod] {:?}", ext4_err);
                    ext4_err.error() as usize
                })
        } else if mode == InodeMode::FileREG {
            self.fs
                .fuse_mknod(self.meta.ino as u64, name, mode as u32, 0, 0)
                .map_err(|ext4_err| {
                    error!("[Ext4Inode::mknod] {:?}", ext4_err);
                    ext4_err.error() as usize
                })
        } else {
            Err(1)
        }?;
        let name = self.meta.path.clone_and_append(name);
        let ino = new_inode_ref.inode_num as usize;
        let meta = Arc::new(InodeMeta::new(Some(this.clone()), name, mode, 0, ino));
        Ok(Arc::new(Ext4Inode {
            fs: self.fs.clone(),
            meta,
        }))
    }
    fn get_meta(&self) -> Arc<InodeMeta> {
        self.meta.clone()
    }
    fn load_children_from_disk(&self, this: Arc<dyn Inode>) {
        // debug!("[Ext4Inode::load_children_from_disk] enter.");
        assert_eq!(self.meta.mode, InodeMode::FileDIR);
        let mut meta_inner = self.meta.inner.lock();
        let dir_entries = self
            .fs
            .fuse_readdir(self.meta.ino as u64, 0, 0)
            .map_err(|ext4_err| {
                error!("[Ext4Inode::load_children_from_disk] {:?}", ext4_err);
                ext4_err.error() as usize
            })
            .unwrap();
        dir_entries.iter().for_each(|entry| {
            let ino = entry.inode as usize;
            // let name = String::from_utf8(Vec::from(entry.name)).unwrap();
            // let name = name.trim().to_string();
            let name = entry.get_name();
            // debug!("[Ext4Inode::load_children_from_disk] name: {}", name);
            if name == "." || name == ".." {
                // debug!("[Ext4Inode::load_children_from_disk] skip");
                return;
            }
            let path = self.meta.path.clone_and_append(&name);
            let mode = dirent_inodetype_2_inodemode(unsafe { entry.inner.inode_type });
            let data_size = Self::get_size_from_ino(&self.fs, ino as u64);

            let inode_meta = InodeMeta::new(Some(this.clone()), path, mode, data_size, ino);
            let inode = Arc::new(Ext4Inode {
                fs: self.fs.clone(),
                meta: Arc::new(inode_meta),
            });
            meta_inner.children.insert(name, inode);
        });
        // debug!("[Ext4Inode::load_children_from_disk] exit.");
    }

    fn clear(&self) {
        unimplemented!()
    }
}

fn dirent_inodetype_2_inodemode(inode_type: u8) -> InodeMode {
    match inode_type {
        1 => InodeMode::FileREG,
        2 => InodeMode::FileDIR,
        3 => InodeMode::FileCHR,
        4 => InodeMode::FileBLK,
        5 => InodeMode::FileFIFO,
        6 => InodeMode::FileSOCK,
        7 => InodeMode::FileLNK,
        _ => panic!("[dirent_inodetype_2_inodemode] inode type should not be unknown"),
    }
}
