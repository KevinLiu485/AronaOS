use core::borrow::BorrowMut;

use crate::{
    fs::inode::{Inode, InodeMeta, InodeMode},
    AsyncResult, SysResult,
};
use alloc::{boxed::Box, string::ToString, sync::Arc};
use ext4_rs::{Ext4, Ext4File, Ext4InodeRef, Ext4MountPoint, OpenFlag};
use log::{debug, error, warn};

pub struct Ext4Inode {
    fs: Arc<Ext4>,
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
        // self.fs
        //     .fuse_getattr(self.meta.ino as u64)
        //     .map_err(|ext4_err| {
        //         error!("[Ext4Inode::update_size] {:?}", ext4_err);
        //         ext4_err.error() as usize
        //     })
        //     .unwrap()
        //     .size as usize
        Ext4Inode::get_size_from_ino(&self.fs, self.meta.ino as u64)
    }

    fn get_size_from_ino(fs: &Arc<Ext4>, ino: u64) -> usize {
        // debug!("[get_size_from_ino]");
        // fs.fuse_getattr(ino as u64)
        //     .map_err(|ext4_err| {
        //         error!("[Ext4Inode::update_size] {:?}", ext4_err);
        //         ext4_err.error() as usize
        //     })
        //     .unwrap()
        //     .size as usize
        let inode_ref = Ext4InodeRef::get_inode_ref(Arc::downgrade(fs), ino as u32);
        inode_ref.inner.inode.inode_get_size() as usize
    }

    fn create_ext4_file(&self, offset: usize) -> Ext4File {
        Ext4File {
            mp: Ext4MountPoint::new("/"),
            inode: self.meta.ino as u32,
            flags: OpenFlag::O_RDWR.bits(),
            fsize: self.meta.inner.lock().data_size as u64,
            fpos: offset,
        }
    }
}

impl Inode for Ext4Inode {
    fn read<'a>(&'a self, offset: usize, buf: &'a mut [u8]) -> AsyncResult<usize> {
        Box::pin(async move {
            // let _ = self.fs.fuse_open(self.meta.ino as u64, 0);
            // let data = self
            //     .fs
            // .fuse_read(
            //     self.meta.ino as u64,
            //     0,
            //     offset as i64,
            //     buf.len() as u32,
            //     0,
            //     None,
            // )
            // .map_err(|ext4_err| {
            //     error!("[Ext4Inode::read] {:?}", ext4_err);
            //     ext4_err.error() as usize
            // })?;
            let mut read_cnt = 0usize;
            let _ = self
                .fs
                .ext4_file_read(
                    &mut self.create_ext4_file(offset),
                    buf,
                    buf.len(),
                    &mut read_cnt,
                )
                .map_err(|ext4_err| {
                    error!("[Ext4Inode::read] {:?}", ext4_err);
                    ext4_err.error() as usize
                })?;
            Ok(read_cnt)
        })
    }
    fn write<'a>(&'a self, offset: usize, buf: &'a [u8]) -> AsyncResult<usize> {
        // todo!();
        // Box::pin(async move {
        //     let data = self
        //         .fs
        //         .fuse_write(self.meta.ino as u64, 0, offset as i64, buf, 0, 0, None)
        //         .map_err(|ext4_err| {
        //             error!("[Ext4Inode::write] {:?}", ext4_err);
        //             ext4_err.error() as usize
        //         })?;
        //     self.update_size();
        //     Ok(data as usize)
        // })
        Box::pin(async move {
            let _ = self
                .fs
                .ext4_file_write(&mut self.create_ext4_file(offset), buf, buf.len());
            self.update_size();
            Ok(buf.len())
        })
    }
    fn mknod(
        &self,
        this: Arc<dyn Inode>,
        name: &str,
        mode: InodeMode,
    ) -> SysResult<Arc<dyn Inode>> {
        // todo!();
        if self.meta.mode != InodeMode::FileDIR {
            return Err(1);
        }
        let new_path = self.get_meta().path.to_string() + "/" + name;
        let new_ino = if mode == InodeMode::FileDIR {
            // self.fs
            //     .fuse_mkdir(self.meta.ino as u64, name, mode as u32, 0)
            //     .map_err(|ext4_err| {
            //         error!("[Ext4Inode::mknod] {:?}", ext4_err);
            //         ext4_err.error() as usize
            //     })
            // let dir_name =
            // let _ = self.fs.ext4_dir_mk(&new_path);
            let mut file_out = Ext4File::new();
            let _ = self.fs.ext4_open(&mut file_out, &new_path, "a+", false);
            file_out.inode
        } else if mode == InodeMode::FileREG {
            // self.fs
            //     .fuse_mknod(self.meta.ino as u64, name, mode as u32, 0, 0)
            //     .map_err(|ext4_err| {
            //         error!("[Ext4Inode::mknod] {:?}", ext4_err);
            //         ext4_err.error() as usize
            //     })
            let mut file_out = Ext4File::new();
            let _ = self.fs.ext4_open(&mut file_out, &new_path, "a+", true);
            file_out.inode
        } else {
            // Err(1)
            return Err(1);
        };
        let name = self.meta.path.clone_and_append(name);
        // let ino = new_ino as usize;
        let meta = Arc::new(InodeMeta::new(
            Some(this.clone()),
            name,
            mode,
            0,
            new_ino as usize,
        ));
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
            // .fuse_readdir(self.meta.ino as u64, 0, 0)
            .read_dir_entry(self.meta.ino as u64);
        // .map_err(|ext4_err| {
        //     error!("[Ext4Inode::load_children_from_disk] {:?}", ext4_err);
        //     ext4_err.error() as usize
        // })
        // .unwrap();
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
        // warn!("[Ext4Inode::clear] not implemented");
        // unimplemented!()
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
