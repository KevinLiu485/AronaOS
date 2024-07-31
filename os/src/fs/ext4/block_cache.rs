use crate::drivers::block::block_dev::BlockDevice;
use crate::drivers::block::VIRTIO_BLOCK_SIZE;
use crate::drivers::BLOCK_DEVICE;
// use crate::fs::fat32::BLOCK_SIZE;
use crate::mutex::SpinNoIrqLock;
use crate::BLOCK_CACHE_SIZE;

// use super::block_dev::BlockDevice;
// use super::{SpinNoIrqLock, BLOCK_SIZE};
use alloc::collections::VecDeque;
use alloc::sync::Arc;
use alloc::vec;
use alloc::vec::Vec;
use lazy_static::*;
/// Cached block inside memory
pub struct BlockCache {
    /// cached block data
    cache: [u8; VIRTIO_BLOCK_SIZE],
    /// underlying block id
    block_id: usize,
    /// underlying block device
    block_device: Arc<dyn BlockDevice>,
    /// whether the block is dirty
    modified: bool,
}

impl BlockCache {
    /// Load a new BlockCache from disk.
    pub fn new(block_id: usize, block_device: Arc<dyn BlockDevice>) -> Self {
        let mut cache = [0u8; VIRTIO_BLOCK_SIZE];
        block_device.read_block(block_id, &mut cache);
        Self {
            cache,
            block_id,
            block_device,
            modified: false,
        }
    }
    /// Get the address of an offset inside the cached block data
    fn addr_of_offset(&self, offset: usize) -> usize {
        &self.cache[offset] as *const _ as usize
    }

    pub fn get_ref<T>(&self, offset: usize) -> &T
    where
        T: Sized,
    {
        let type_size = core::mem::size_of::<T>();
        assert!(offset + type_size <= VIRTIO_BLOCK_SIZE);
        let addr = self.addr_of_offset(offset);
        unsafe { &*(addr as *const T) }
    }

    pub fn get_mut<T>(&mut self, offset: usize) -> &mut T
    where
        T: Sized,
    {
        let type_size = core::mem::size_of::<T>();
        assert!(offset + type_size <= VIRTIO_BLOCK_SIZE);
        self.modified = true;
        let addr = self.addr_of_offset(offset);
        unsafe { &mut *(addr as *mut T) }
    }

    pub fn read<T, V>(&self, offset: usize, f: impl FnOnce(&T) -> V) -> V {
        f(self.get_ref(offset))
    }

    pub fn modify<T, V>(&mut self, offset: usize, f: impl FnOnce(&mut T) -> V) -> V {
        f(self.get_mut(offset))
    }

    pub fn sync(&mut self) {
        if self.modified {
            self.modified = false;
            self.block_device.write_block(self.block_id, &self.cache);
        }
    }
}

impl Drop for BlockCache {
    fn drop(&mut self) {
        self.sync()
    }
}

struct BlockCacheQueue {
    queue: VecDeque<(usize, Arc<SpinNoIrqLock<BlockCache>>)>,
}

pub struct BlockCacheManager {
    // queue: VecDeque<(usize, Arc<SpinNoIrqLock<BlockCache>>)>,
    inner: SpinNoIrqLock<BlockCacheQueue>,
    block_device: Arc<dyn BlockDevice>,
}

impl BlockCacheManager {
    pub fn new(block_device: Arc<dyn BlockDevice>) -> Self {
        Self {
            inner: SpinNoIrqLock::new(BlockCacheQueue {
                queue: VecDeque::new(),
            }),
            block_device,
        }
    }

    pub fn get_block_cache(
        &self,
        block_id: usize,
        // block_device: Arc<dyn BlockDevice>,
    ) -> Arc<SpinNoIrqLock<BlockCache>> {
        let mut inner = self.inner.lock();
        let mut queue = &mut inner.queue;
        if let Some(pair) = queue.iter().find(|pair| pair.0 == block_id) {
            Arc::clone(&pair.1)
        } else {
            // substitute
            if queue.len() == BLOCK_CACHE_SIZE {
                // from front to tail
                if let Some((idx, _)) = queue
                    .iter()
                    .enumerate()
                    .find(|(_, pair)| Arc::strong_count(&pair.1) == 1)
                {
                    queue.drain(idx..=idx);
                } else {
                    panic!("Run out of BLOCK_CACHE!");
                }
            }
            // load block into mem and push back
            let block_cache = Arc::new(SpinNoIrqLock::new(BlockCache::new(
                block_id,
                // Arc::clone(&block_device),
                self.block_device.clone(),
            )));
            queue.push_back((block_id, Arc::clone(&block_cache)));
            block_cache
        }
    }
}

impl ext4_rs::BlockDevice for BlockCacheManager {
    // read data from offset in byte, return a Vec<u8> with length of ext4_rs::BLOCK_SIZE(4096 B)
    fn read_offset(&self, offset: usize) -> Vec<u8> {
        // let mut block_id = offset / VIRTIO_BLOCK_SIZE;
        // let mut buf = vec![0u8; VIRTIO_BLOCK_SIZE];
        // let mut ret = Vec::<u8>::new();
        // let aligned = offset % VIRTIO_BLOCK_SIZE == 0;
        // let times = if aligned {
        //     ext4_rs::BLOCK_SIZE / VIRTIO_BLOCK_SIZE
        // } else {
        //     ext4_rs::BLOCK_SIZE / VIRTIO_BLOCK_SIZE + 1
        // };
        // ret.reserve(times * VIRTIO_BLOCK_SIZE);
        // for _ in 0..times {
        //     // self.0
        //     //     .exclusive_access()
        //     //     .read_block(block_id, &mut buf)
        //     //     .expect("Error when reading VirtIOBlk");
        //     let cache = self.get_block_cache(block_id);
        //     cache.lock().read(0, |buf: &[u8; VIRTIO_BLOCK_SIZE]| {
        //         ret.extend_from_slice(buf);
        //     });
        //     // todo!()
        //     block_id += 1;
        //     // ret.extend_from_slice(&buf);
        // }
        // if aligned {
        //     ret
        // } else {
        //     ret[(offset % VIRTIO_BLOCK_SIZE)..(offset % VIRTIO_BLOCK_SIZE + ext4_rs::BLOCK_SIZE)]
        //         .to_vec()
        // }
        let mut block_id = offset / VIRTIO_BLOCK_SIZE;
        let mut ret = Vec::<u8>::with_capacity(ext4_rs::BLOCK_SIZE);
        let mut read_cnt = 0;
        while read_cnt < ext4_rs::BLOCK_SIZE {
            let cache = self.get_block_cache(block_id);
            cache.lock().read(0, |buf: &[u8; VIRTIO_BLOCK_SIZE]| {
                let start = if read_cnt == 0 {
                    offset % VIRTIO_BLOCK_SIZE
                } else {
                    0
                };
                let end = core::cmp::min(VIRTIO_BLOCK_SIZE, ext4_rs::BLOCK_SIZE - read_cnt);
                read_cnt += end - start;
                ret.extend_from_slice(&buf[start..end]);
            });
            block_id += 1;
        }
        ret
    }

    // write all data to offset
    fn write_offset(&self, offset: usize, data: &[u8]) {
        // todo!()
        // let len = data.len();
        // we cannot write half blocks
        // assert!(offset % VIRTIO_BLOCK_SIZE == 0);
        // assert!(len % VIRTIO_BLOCK_SIZE == 0);
        // let mut block_id = offset / VIRTIO_BLOCK_SIZE;
        // for i in 0..len / VIRTIO_BLOCK_SIZE {
        //     self.0
        //         .exclusive_access()
        //         .write_block(
        //             block_id,
        //             &data[i * VIRTIO_BLOCK_SIZE..(i + 1) * VIRTIO_BLOCK_SIZE],
        //         )
        //         .expect("Error when writing VirtIOBlk");
        //     block_id += 1;
        // }
        let mut block_id = offset / VIRTIO_BLOCK_SIZE;
        // let mut ret = Vec::<u8>::with_capacity(ext4_rs::BLOCK_SIZE);
        let mut write_cnt = 0;
        let total_len = data.len();
        while write_cnt < total_len {
            let cache = self.get_block_cache(block_id);
            // cache.lock().read(0, |buf: &[u8; VIRTIO_BLOCK_SIZE]| {
            //     let start = if write_cnt == 0 {
            //         offset % VIRTIO_BLOCK_SIZE
            //     } else {
            //         0
            //     };
            //     let end = core::cmp::min(VIRTIO_BLOCK_SIZE, ext4_rs::BLOCK_SIZE - write_cnt);
            //     write_cnt += end - start;
            //     ret.extend_from_slice(&buf[start..end]);
            // });
            cache.lock().modify(0, |buf: &mut [u8; VIRTIO_BLOCK_SIZE]| {
                let start = if write_cnt == 0 {
                    offset % VIRTIO_BLOCK_SIZE
                } else {
                    0
                };
                let end = core::cmp::min(VIRTIO_BLOCK_SIZE, start + total_len - write_cnt);
                let len = end - start;
                buf[start..end].copy_from_slice(&data[write_cnt..(write_cnt + len)]);
                write_cnt += len;
            });
            block_id += 1;
        }
    }
}

lazy_static! {
    /// The global block cache manager
    // pub static ref BLOCK_CACHE_MANAGER: SpinNoIrqLock<BlockCacheManager> =
    //     SpinNoIrqLock::new(BlockCacheManager::new(BLOCK_DEVICE.clone()));
    pub static ref EXT4_BLOCK_CACHE_MANAGER: Arc<BlockCacheManager> = Arc::new(BlockCacheManager::new(BLOCK_DEVICE.clone()));
}
// / Get the block cache corresponding to the given block id and block device
// pub fn get_block_cache(
//     block_id: usize,
//     block_device: Arc<dyn BlockDevice>,
// ) -> Arc<SpinNoIrqLock<BlockCache>> {
//     BLOCK_CACHE_MANAGER
//         .lock()
//         .get_block_cache(block_id, block_device)
// }
// / Sync all block cache to block device
// #[allow(unused)]
// pub fn block_cache_sync_all() {
//     // let manager = BLOCK_CACHE_MANAGER.lock();
//     // for (_, cache) in manager.queue.iter() {
//     //     cache.lock().sync();
//     // }
//     for (_, cache) in BLOCK_CACHE_MANAGER.queue.iter() {
//         cache.lock().sync();
//     }
// }
