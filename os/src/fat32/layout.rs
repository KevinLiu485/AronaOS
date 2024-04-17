use alloc::vec::Vec;

pub const BLOCK_SIZE: usize = 512;
/// Use a block cache of 16 blocks
pub const BLOCK_CACHE_SIZE: usize = 16;

pub struct FAT32FileSystem {
    pub meta: FAT32Meta,
}

pub struct FAT32Meta {
    pub reversed_region: Vec<FAT32Sector>,
    pub fat_region: Vec<FAT32Sector>,
    pub data_region: Vec<FAT32Sector>,
}

pub struct FAT32Sector {
    pub data: Vec<u8>,
}

#[repr(C, packed)] // make sure layout is packed and exactly the same as on disk(90 bytes)
#[allow(non_snake_case)]
#[derive(Clone, Copy, Debug)]
pub struct FAT32BootSector {
    // Boot
    pub BS_jmpBoot: [u8; 3], // use for x86 boot, ignore.
    pub BS_OEMName: [u8; 8], // usually "MSWIN4.1"

    // essential BPB
    pub BPB_BytesPerSector: u16,        // must 512, ..., 4096, usually 512
    pub BPB_SectorPerCluster: u8,       // must 1,2,4,...,128.
    pub BPB_ReservedSectorCount: u16,   // usually 32 for FAT32
    pub BPB_NumFATs: u8,                // usually 2 for FAT32
    pub BPB_RootEntryCount: u16,        // must 0 for FAT32
    pub BPB_TotSector16: u16,           // must 0 for FAT32
    pub BPB_Media: u8,                  // usually 0xF8, ignore.
    pub BPB_FATsize16: u16,             // must 0 for FAT32
    pub BPB_SectorPerTrack: u16,        // use for interrupt 0x13, ignore.
    pub BPB_NumHeads: u16,              // use for interrupt 0x13, ignore.
    pub BPB_HiddSec: u32,               // Hidden Sector Count, ignore.
    pub BPB_TotSector32: u32,           // Total Sector count, region 1, 2, 3, 4.

    // BPB For FAT32
    pub BPB_FATsize32: u32,     // ONE FAT Sector count.
    pub BPB_ExtFlags: u16,      // usually 0 when FAT is mirrored at runtime.
    pub BPB_FSVer: u16,         // must 0 in current version
    pub BPB_RootCluster: u32,   // Root Dir Cluster id, usally 2
    pub BPB_FSInfo: u16,        // FSINFO Sector id, usually 1
    pub BPB_BkBootSec: u16,     // Backup Sector id, usually 6
    pub BPB_Reserved: [u8; 12], // 0

    // BS(end)
    pub BS_DrvNum: u8,           // use for interrupt 0x13, 0x80 for hard disk
    pub BS_Reserved1: u8,        // 0
    pub BS_BootSig: u8,          // 0x29
    pub BS_VolID: u32,           // xjb Generator ?
    pub BS_VolLabel: [u8; 11],   // 11*0x30 ?
    pub BS_FileSysType: [u8; 8], // "FAT32 0x30*3"
}

impl FAT32BootSector {
    // pub fn as_bytes(&self) -> &[u8] {
    //     unsafe {
    //         core::slice::from_raw_parts(
    //             self as *const _ as *const u8,
    //             core::mem::size_of::<FAT32BootSector>(),
    //         )
    //     }
    // }
    // pub fn as_bytes_mut(&mut self) -> &mut [u8] {
    //     unsafe {
    //         core::slice::from_raw_parts_mut(
    //             self as *mut _ as *mut u8,
    //             core::mem::size_of::<FAT32BootSector>(),
    //         )
    //     }
    // }
    pub fn is_valid(&self) -> bool {
        return self.BS_BootSig == 0x29 && self.BS_FileSysType == "FAT32   ".as_bytes();
    }
    // pub fn from_raw_parts(data: &[u8]) -> FAT32BootSector {
    //     unsafe { *(data.as_ptr() as *const FAT32BootSector) }
    // }
}

#[allow(non_snake_case)]
pub struct FAT32FSInfoSector {
    pub FSI_LeadSig: u32,         // 0x41615252
    pub FSI_Reserved1: [u8; 480], // 0
    pub FSI_StrucSig: u32,        // 0x61417272
    pub FSI_Free_Count: u32,      // free cluster count. 0xFFFFFFFF means unknown.
    pub FSI_Nxt_Free: u32,        // next free cluster
    pub FSI_Reserved2: [u8; 12],  // 0
    pub FSI_TrailSig: u32,        // 0xAA550000
}

#[allow(non_snake_case)]
pub struct FAT32DirEntry {
    pub DIR_Name: [u8; 11],      // short name
    pub DIR_Attr: FAT32FileAttr, // file attribute
    pub DIR_NTRes: u8,           // reserved. init always with 0
    pub DIR_CrtTimeTenth: u8,    // create time (0.1s), 0-199
    pub DIR_CrtTime: FAT32Time,  // create time (2s)
    pub DIR_CrtDate: FAT32Date,  // create date
    pub DIR_LstAccDate: u16,     // last access date
    pub DIR_FstClusHI: u16,      // high 16 bits of cluster number of this entry
    pub DIR_WrtTime: FAT32Time,  // last write time, including creation
    pub DIR_WrtDate: FAT32Date,  // last write date, including creation
    pub DIR_FstClusLO: u16,      // low 16 bits of cluster number of thisk entry
    pub DIR_FileSize: u32,       // file size in bytes, 0 for directory
}

impl FAT32DirEntry {
    pub fn check_sum(&self) -> u8 {
        let mut sum: u8 = 0;
        for c in self.DIR_Name.iter() {
            sum = ((sum & 1) << 7) + (sum >> 1) + c;
        }
        sum
    }
}

// must be paired with FAT32DirEntry, logically and physically contiguous
#[allow(non_snake_case)]
pub struct FAT32LongDirEntry {
    pub LDIR_Ord: u8,         // order of this entry in the sequence of long dir entries
    pub LDIR_Name1: [u16; 5], // unicode characters 1-5
    pub LDIR_Attr: u8,        // must be ATTR_LONG_NAME
    pub LDIR_Type: u8,        // must be 0
    pub LDIR_Chksum: u8,      // checksum of the short file name
    pub LDIR_Name2: [u16; 6], // unicode characters 6-11
    pub LDIR_FstClusLO: u16,  // must be 0
    pub LDIR_Name3: [u16; 2], // unicode characters 12-13
}

pub struct FAT32FileAttr {
    // 0x01           | 0x02        | 0x04        | 0x08           | 0x10           | 0x20         | 0x40 | 0x80
    // ATTR_READ_ONLY | ATTR_HIDDEN | ATTR_SYSTEM | ATTR_VOLUME_ID | ATTR_DIRECTORY | ATTR_ARCHIVE | 0    | 0
    pub bits: u8,
}

pub struct FAT32Date {
    // 0x000F | 0x00F0 | 0xFF00
    // day    | month  | year
    pub bits: u16,
}

pub struct FAT32Time {
    // 0x001F   | 0x07E0 | 0xF800
    // 2*second | minute | hour
    pub bits: u16,
}
