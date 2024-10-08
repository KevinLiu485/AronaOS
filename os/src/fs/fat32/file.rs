use core::cmp::{max, min};

use alloc::{sync::Arc, vec::Vec};

use super::{
    block_cache::get_block_cache, fat::FAT32FileAllocTable, FATENTRY_MIN_EOC, SECTOR_SIZE,
};

pub struct FAT32File {
    pub fat: Arc<FAT32FileAllocTable>,
    clusters: Vec<usize>,
    pub size: Option<usize>,
}

impl FAT32File {
    pub fn new(fat: Arc<FAT32FileAllocTable>, first_cluster: usize, size: Option<usize>) -> Self {
        let mut clusters_vec = Vec::new();
        if first_cluster != 0 {
            clusters_vec.push(first_cluster);
        }
        Self {
            fat: Arc::clone(&fat),
            clusters: clusters_vec,
            size,
        }
    }

    #[allow(unused)]
    pub fn first_cluster(&self) -> u32 {
        if self.clusters.is_empty() == false {
            self.clusters[0] as u32
        } else {
            0
        }
    }

    fn get_clusters(&mut self) {
        if self.clusters.is_empty() == false {
            loop {
                let nxt_cluster = self.fat.read_fat(*self.clusters.last().unwrap()).unwrap();
                if nxt_cluster >= FATENTRY_MIN_EOC {
                    break;
                }
                self.clusters.push(nxt_cluster as usize);
            }
        }
        if self.size.is_none() {
            self.size = Some(self.clusters.len() * SECTOR_SIZE * self.fat.meta.sector_per_cluster);
        }
    }

    pub fn modify_size(&mut self, delta: isize) -> usize {
        self.get_clusters();
        let sector_per_cluster = self.fat.meta.sector_per_cluster;
        if delta < 0 && (self.size.unwrap() as isize) + delta >= 0 {
            let new_sz = ((self.size.unwrap() as isize) + delta) as usize;
            let cluster_count = (new_sz + sector_per_cluster * SECTOR_SIZE - 1)
                / (sector_per_cluster * SECTOR_SIZE);
            while self.clusters.len() > cluster_count {
                let end0 = self.clusters.pop().unwrap();
                if self.clusters.len() > 0 {
                    let end1 = *self.clusters.last().unwrap();
                    self.fat.free_cluster(end0, Some(end1));
                } else {
                    self.fat.free_cluster(end0, None);
                }
            }
            self.size = Some(new_sz);
        } else if delta > 0 {
            let new_sz = self.size.unwrap() + (delta as usize);
            let cluster_count = (new_sz + sector_per_cluster * SECTOR_SIZE - 1)
                / (sector_per_cluster * SECTOR_SIZE);
            while self.clusters.len() < cluster_count {
                let new_cluster;
                if self.clusters.len() > 0 {
                    new_cluster = self
                        .fat
                        .alloc_cluster(Some(*self.clusters.last().unwrap()))
                        .unwrap();
                } else {
                    new_cluster = self.fat.alloc_cluster(None).unwrap();
                }
                self.clusters.push(new_cluster);
            }
            self.size = Some(new_sz);
        }
        self.size.unwrap()
    }

    pub fn read(&mut self, data: &mut [u8], offset: usize) -> usize {
        self.get_clusters();
        let st = min(offset, self.size.unwrap());
        let ed = min(offset + data.len(), self.size.unwrap());
        let sector_per_cluster = self.fat.meta.sector_per_cluster;
        let ret = ed - st;
        let st_cluster = st / (sector_per_cluster * SECTOR_SIZE);
        let ed_cluster =
            (ed + sector_per_cluster * SECTOR_SIZE - 1) / (sector_per_cluster * SECTOR_SIZE);
        for cseq in st_cluster..ed_cluster {
            let cluster_id = self.clusters[cseq];
            let sector_id = self.fat.meta.cid_to_sid(cluster_id).unwrap();
            for j in 0..sector_per_cluster {
                // off=(cseq*SectorPerCluster+j)
                // byte=[off*SECTOR_SIZE, (off+1)*SECTOR_SIZE)
                let off = cseq * sector_per_cluster + j;
                let sector_st = off * SECTOR_SIZE;
                let sector_ed = sector_st + SECTOR_SIZE;
                if sector_ed <= st || sector_st >= ed {
                    continue;
                }
                let cur_st = max(sector_st, st);
                let cur_ed = min(sector_ed, ed);
                let mut tmp_data: [u8; SECTOR_SIZE] = [0; SECTOR_SIZE];
                get_block_cache(sector_id + j, self.fat.block_device.clone())
                    .lock()
                    .read(0, |data: &[u8; SECTOR_SIZE]| tmp_data.copy_from_slice(data));
                for i in cur_st..cur_ed {
                    data[i - st] = tmp_data[i - sector_st];
                }
            }
        }
        ret
    }

    pub fn write(&mut self, data: &[u8], offset: usize) -> usize {
        self.get_clusters();
        let st = min(offset, self.size.unwrap());
        let ed = offset + data.len();
        let sector_per_cluster = self.fat.meta.sector_per_cluster;
        if self.size.unwrap() < ed {
            self.modify_size((ed - self.size.unwrap()) as isize);
        }
        let ret = ed - st;
        let st_cluster = st / (sector_per_cluster * SECTOR_SIZE);
        let ed_cluster =
            (ed + sector_per_cluster * SECTOR_SIZE - 1) / (sector_per_cluster * SECTOR_SIZE);
        for cseq in st_cluster..ed_cluster {
            let cluster_id = self.clusters[cseq];
            let sector_id = self.fat.meta.cid_to_sid(cluster_id).unwrap();
            for j in 0..sector_per_cluster {
                // off=(cseq*SectorPerCluster+j)
                // byte=[off*SECTOR_SIZE, (off+1)*SECTOR_SIZE)
                let off = cseq * sector_per_cluster + j;
                let sector_st = off * SECTOR_SIZE;
                let sector_ed = sector_st + SECTOR_SIZE;
                if sector_ed <= st || sector_st >= ed {
                    continue;
                }
                let cur_st = max(sector_st, st);
                let cur_ed = min(sector_ed, ed);
                let mut tmp_data: [u8; SECTOR_SIZE] = [0; SECTOR_SIZE];
                if cur_st != sector_st || cur_ed != sector_ed {
                    get_block_cache(sector_id + j, self.fat.block_device.clone())
                        .lock()
                        .read(0, |data: &[u8; SECTOR_SIZE]| tmp_data.copy_from_slice(data));
                }
                for i in cur_st..cur_ed {
                    tmp_data[i - sector_st] = data[i - st];
                }
                get_block_cache(sector_id + j, self.fat.block_device.clone())
                    .lock()
                    .modify(0, |data: &mut [u8; SECTOR_SIZE]| {
                        data.copy_from_slice(&tmp_data)
                    });
            }
        }
        ret
    }

    pub fn clear(&mut self) {
        self.clusters.iter().for_each(|&cluster_id| {
            self.fat.free_cluster(cluster_id, None);
        });
        self.clusters.clear();
        self.size = Some(0);
    }
}
