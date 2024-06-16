//! Implementation of [`PageTableEntry`] and [`PageTable`].
use super::{
    frame_alloc, FrameTracker, PhysAddr, PhysPageNum, VirtAddr, VirtPageNum, KERNEL_SPACE,
};
use crate::{KERNEL_DIRECT_OFFSET, USER_MAX_VA};
use alloc::string::String;
use alloc::vec;
use alloc::vec::Vec;
use bitflags::*;
use core::fmt::{self, Debug, Formatter};
use log::{debug, error, trace};
use riscv::register::satp;

bitflags! {
    pub struct PTEFlags: u16 {
        const V = 1 << 0;
        const R = 1 << 1;
        const W = 1 << 2;
        const X = 1 << 3;
        const U = 1 << 4;
        const G = 1 << 5;
        const A = 1 << 6;
        const D = 1 << 7;
        const COW = 1 << 8;
    }
}

#[allow(unused)]
/// convert pte's flas to readable str
impl PTEFlags {
    pub fn readable_flags(&self) -> String {
        let mut ret = String::new();
        if *self & PTEFlags::V != PTEFlags::empty() {
            ret.push_str("V");
        }
        if *self & PTEFlags::R != PTEFlags::empty() {
            ret.push_str("R");
        }
        if *self & PTEFlags::W != PTEFlags::empty() {
            ret.push_str("W");
        }
        if *self & PTEFlags::X != PTEFlags::empty() {
            ret.push_str("X");
        }
        if *self & PTEFlags::U != PTEFlags::empty() {
            ret.push_str("U");
        }
        if *self & PTEFlags::A != PTEFlags::empty() {
            ret.push_str("A");
        }
        if *self & PTEFlags::D != PTEFlags::empty() {
            ret.push_str("D");
        }
        if *self & PTEFlags::COW != PTEFlags::empty() {
            ret.push_str("C");
        }
        ret
    }
}

#[derive(Copy, Clone)]
#[repr(C)]
/// page table entry structure
pub struct PageTableEntry {
    ///PTE
    pub bits: usize,
}

impl Debug for PageTableEntry {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        let ppn = self.bits >> 10;
        let flags = self.flags().readable_flags();

        write!(f, "PTE {{ ppn: 0x{:X}, flags: {} }}", ppn, flags)
    }
}

impl PageTableEntry {
    ///Create a PTE from ppn
    pub fn new(ppn: PhysPageNum, flags: PTEFlags) -> Self {
        PageTableEntry {
            bits: ppn.0 << 10 | flags.bits as usize,
        }
    }
    /// Create a PTE from exist PTE, but clear PTE_W and set PTE_COW
    /// especially for COW
    pub fn from_pte_cow(pte: PageTableEntry) -> Self {
        let mut flags = pte.flags();
        flags.remove(PTEFlags::W);
        flags.insert(PTEFlags::COW);
        PageTableEntry {
            bits: pte.ppn().0 << 10 | flags.bits as usize,
        }
    }
    ///Return an empty PTE
    pub fn empty() -> Self {
        PageTableEntry { bits: 0 }
    }
    ///Return 44bit ppn
    pub fn ppn(&self) -> PhysPageNum {
        (self.bits >> 10 & ((1usize << 44) - 1)).into()
    }
    ///Return 10bit flag
    pub fn flags(&self) -> PTEFlags {
        // PTEFlags::from_bits(self.bits as u16).unwrap()
        PTEFlags::from_bits_truncate(self.bits as u16)
    }
    ///Check PTE valid
    pub fn is_valid(&self) -> bool {
        (self.flags() & PTEFlags::V) != PTEFlags::empty()
    }
    ///Check PTE readable
    pub fn readable(&self) -> bool {
        (self.flags() & PTEFlags::R) != PTEFlags::empty()
    }
    ///Check PTE writable
    pub fn writable(&self) -> bool {
        (self.flags() & PTEFlags::W) != PTEFlags::empty()
    }
    ///Check PTE executable
    pub fn executable(&self) -> bool {
        (self.flags() & PTEFlags::X) != PTEFlags::empty()
    }
    ///Check PTE User mode
    pub fn is_user(&self) -> bool {
        (self.flags() & PTEFlags::U) != PTEFlags::empty()
    }
    /// Check PTE COW
    pub fn is_cow(&self) -> bool {
        (self.flags() & PTEFlags::COW) != PTEFlags::empty()
    }
}

#[derive(Debug)]
///Record root ppn and has the same lifetime as 1 and 2 level `PageTableEntry`
pub struct PageTable {
    /// Todo*: pub for debug
    pub root_ppn: PhysPageNum,
    // 三级页表都是独占的
    frames: Vec<FrameTracker>,
}

/// Assume that it won't oom when creating/mapping.
impl PageTable {
    /// Create an empty `PageTable`, only own its root page table
    pub fn new() -> Self {
        let frame = frame_alloc().unwrap();
        PageTable {
            root_ppn: frame.ppn,
            // all Page-size pagetable are owned by the pagetable
            frames: vec![frame],
        }
    }
    /// Create a page table from existed user space, especially for `fork`(COW)
    pub fn from_existed_user(par_pagtbl: &PageTable) -> Self {
        let cld_root_frame = frame_alloc().unwrap();
        let cld_root_ppn = cld_root_frame.ppn;
        let mut frames: Vec<FrameTracker> = Vec::new();
        let prt_root_ppn = par_pagtbl.root_ppn;
        // parent and child root page table
        let cld_1_table = cld_root_frame.ppn.get_pte_array();
        let prt_1_table = prt_root_ppn.get_pte_array();

        // 1. Copy only kernel mapping from parent root page table
        let kernel_start_vpn = VirtPageNum::from(KERNEL_DIRECT_OFFSET);
        let kernel_start_idx1 = kernel_start_vpn.indexes()[0];
        cld_1_table[kernel_start_idx1..].copy_from_slice(&prt_1_table[kernel_start_idx1..]);

        // 2. copy user mapping from parent root page table and 2nd level page table
        // todo: 考虑优化, 将level_1_idx作为常量
        let user_end_vpn = VirtAddr::from(USER_MAX_VA).ceil();
        let user_end_idx1 = user_end_vpn.indexes()[0];
        let prt_1_table_user = &prt_1_table[..user_end_idx1];
        for (idx1, prt_1_entry) in prt_1_table_user.iter().enumerate() {
            if prt_1_entry.is_valid() {
                let cld_1_pte = &mut cld_1_table[idx1];
                let frame = frame_alloc().unwrap();
                // Copy parent's 2nd level page table
                let prt_2_table = prt_1_entry.ppn().get_pte_array();
                let cld_2_table = frame.ppn.get_pte_array();
                cld_2_table.copy_from_slice(&prt_2_table);
                // add mapping to child 1st level page table
                *cld_1_pte = PageTableEntry::new(frame.ppn, PTEFlags::V);
                // add frame to child pagetable(是子进程独有的)
                frames.push(frame);

                for (idx2, prt_2_entry) in prt_2_table.iter_mut().enumerate() {
                    if prt_2_entry.is_valid() {
                        let cld_2_pte = &mut cld_2_table[idx2];
                        let prt_3_table = prt_2_entry.ppn().get_pte_array();
                        // 3. clear PTE_W and set PTE_COW in parent 3rd level pagetable
                        for ptr_3_entry in prt_3_table.iter_mut() {
                            if ptr_3_entry.writable() {
                                // todo: 优化 modify in place
                                *ptr_3_entry = PageTableEntry::from_pte_cow(*ptr_3_entry);
                            }
                        }
                        // 4. copy parent's 3rd level page table
                        let frame = frame_alloc().unwrap();
                        let cld_3_table = frame.ppn.get_pte_array();
                        cld_3_table.copy_from_slice(&prt_3_table);
                        // add mapping to child 2nd level page table
                        *cld_2_pte = PageTableEntry::new(frame.ppn, PTEFlags::V);
                        // add frame to child pagetable(是子进程独有的)
                        frames.push(frame);
                    }
                }
            }
        }

        frames.push(cld_root_frame);
        // 子进程的页表拥有自己的所有三级页表
        PageTable {
            root_ppn: cld_root_ppn,
            frames,
        }
    }

    /// Create a pagetable from kernel global pagetable
    pub fn from_global() -> Self {
        let frame = frame_alloc().unwrap();
        let global_root_ppn = KERNEL_SPACE.lock().page_table.root_ppn;

        // Map kernel space, just need shallow copy
        // only copy the kernel mapping
        let kernel_start_vpn = VirtPageNum::from(KERNEL_DIRECT_OFFSET);
        let level_1_index = kernel_start_vpn.indexes()[0];

        // Copy from root page table
        let dst_1_table = &mut frame.ppn.get_pte_array()[level_1_index..];
        let src_1_table = global_root_ppn.get_pte_array();
        dst_1_table.copy_from_slice(&src_1_table[level_1_index..]);

        /*
        // Copy valid entries in level 1 table
        for (level_1_entry_index, entry) in dst_1_table.iter_mut().enumerate() {
            if entry.is_valid() {
                let source_level_2_table = &src_1_table[level_1_entry_index].ppn().get_pte_array();
                let level_2_table = &mut entry.ppn().get_pte_array();
                level_2_table.copy_from_slice(source_level_2_table);

                // Copy valid entries in level 2 table
                for (level_2_entry_index, entry) in level_2_table.iter_mut().enumerate() {
                    if entry.is_valid() {
                        let source_level_3_table = &source_level_2_table[level_2_entry_index]
                            .ppn()
                            .get_pte_array();
                        let level_3_table = &mut entry.ppn().get_pte_array();
                        level_3_table.copy_from_slice(source_level_3_table);
                    }
                }
            }
        }
        */
        // the new pagetable only owns the ownership of its own root ppn
        PageTable {
            root_ppn: frame.ppn,
            frames: vec![frame],
        }
    }

    /// Temporarily used to get arguments from user space.
    pub fn from_token(satp: usize) -> Self {
        Self {
            root_ppn: PhysPageNum::from(satp & ((1usize << 44) - 1)),
            frames: Vec::new(),
        }
    }
    /// Find phsical address by virtual address, create a frame if not exist
    fn find_pte_create(&mut self, vpn: VirtPageNum) -> Option<&mut PageTableEntry> {
        let idxs = vpn.indexes();
        let mut ppn = self.root_ppn;
        let mut result: Option<&mut PageTableEntry> = None;
        for (i, idx) in idxs.iter().enumerate() {
            let pte = &mut ppn.get_pte_array()[*idx];
            if i == 2 {
                result = Some(pte);
                break;
            }
            if !pte.is_valid() {
                let frame = frame_alloc().unwrap();
                *pte = PageTableEntry::new(frame.ppn, PTEFlags::V);
                self.frames.push(frame);
            }
            ppn = pte.ppn();
        }
        result
    }
    /// Find phsical address by virtual address
    /// Todo*: pub for debug
    pub fn find_pte(&self, vpn: VirtPageNum) -> Option<&mut PageTableEntry> {
        let idxs = vpn.indexes();
        let mut ppn = self.root_ppn;
        let mut result: Option<&mut PageTableEntry> = None;
        for (i, idx) in idxs.iter().enumerate() {
            let pte = &mut ppn.get_pte_array()[*idx];
            if i == 2 {
                result = Some(pte);
                break;
            }
            if !pte.is_valid() {
                return None;
            }
            ppn = pte.ppn();
        }
        result
    }
    #[allow(unused)]
    /// Create a mapping form `vpn` to `ppn`
    pub fn map(&mut self, vpn: VirtPageNum, ppn: PhysPageNum, flags: PTEFlags) {
        // if vpn.0 & 0x4000000 == 0 {
        //     trace!("[PageTable::map] map: {:?} -> {:?}", vpn, ppn);
        // }
        let pte = self.find_pte_create(vpn).unwrap();
        //let pte = self.find_pte(vpn).unwrap();
        assert!(!pte.is_valid(), "vpn {:?} is mapped before mapping", vpn);
        *pte = PageTableEntry::new(ppn, flags | PTEFlags::V);
    }
    /// remap a page with new PTEFlags, keep the old ppn
    pub fn update_flags(&mut self, vpn: VirtPageNum, flags: PTEFlags) {
        let pte = self.find_pte(vpn).unwrap();
        assert!(
            pte.is_valid(),
            "vpn {:?} is not mapped before update_flags",
            vpn
        );
        *pte = PageTableEntry::new(pte.ppn(), flags | PTEFlags::V);
    }
    #[allow(unused)]
    /// Delete a mapping form `vpn`
    pub fn unmap(&mut self, vpn: VirtPageNum) {
        let pte = self.find_pte(vpn).unwrap();
        assert!(pte.is_valid(), "vpn {:?} is invalid before unmapping", vpn);
        *pte = PageTableEntry::empty();
    }
    /// Translate `VirtPageNum` to `PageTableEntry`
    pub fn translate(&self, vpn: VirtPageNum) -> Option<PageTableEntry> {
        self.find_pte(vpn).map(|pte| *pte)
    }
    /// Translate `VirtAddr` to `PhysAddr`
    pub fn translate_va(&self, va: VirtAddr) -> Option<PhysAddr> {
        self.find_pte(va.clone().floor()).map(|pte| {
            let aligned_pa: PhysAddr = pte.ppn().into();
            let offset = va.page_offset();
            let aligned_pa_usize: usize = aligned_pa.into();
            (aligned_pa_usize + offset).into()
        })
    }
    /// Get root ppn
    pub fn token(&self) -> usize {
        8usize << 60 | self.root_ppn.0
    }
    /// dump mapping va -> ppn in user address space
    #[allow(unused)]
    pub fn dump_all(&self) {
        trace!("[dump_all]");
        error!("pagetable at {:?}", self.root_ppn);
        let pagetable = self.root_ppn.get_pte_array();
        let mut va = 0;
        // 一级页表
        for (index, entry) in pagetable.iter().enumerate() {
            if entry.is_valid() {
                va = va | index << 30;
                let pagetable = entry.ppn().get_pte_array();
                // 二级页表
                for (index, entry) in pagetable.iter().enumerate() {
                    if entry.is_valid() {
                        va = va | index << 21;
                        let pagetable = entry.ppn().get_pte_array();
                        // 三级页表
                        for (index, entry) in pagetable.iter().enumerate() {
                            if entry.is_valid() && entry.is_user() {
                                va = va | index << 12;
                                error!("--- va: {:x}: {:?}", va, entry);
                                va = va & !(index << 12);
                            }
                        }
                    }
                    va = va & !(index << 21);
                }
            }
            va = va & !(index << 30);
        }
    }
    #[allow(unused)]
    /// dump entry only in the given page table
    pub fn dump(&self) {
        debug!("[PageTable::dump]pagetable at {:?}", self.root_ppn);
        let pagetable = self.root_ppn.get_pte_array();
        for (index, entry) in pagetable.iter().enumerate() {
            if entry.is_valid() {
                debug!("{}: {:?}", index, entry);
            }
        }
    }
}

/// Translate a pointer to a mutable u8 Vec through page table
// pub fn translated_byte_buffer(token: usize, ptr: *const u8, len: usize) -> Vec<&'static mut [u8]> {
//     let page_table = PageTable::from_token(token);
//     let mut start = ptr as usize;
//     let end = start + len;
//     let mut v = Vec::new();
//     while start < end {
//         let start_va = VirtAddr::from(start);
//         let mut vpn = start_va.floor();
//         let ppn = page_table.translate(vpn).unwrap().ppn();
//         vpn.step();
//         let mut end_va: VirtAddr = vpn.into();
//         end_va = end_va.min(VirtAddr::from(end));
//         if end_va.page_offset() == 0 {
//             v.push(&mut ppn.get_bytes_array()[start_va.page_offset()..]);
//         } else {
//             v.push(&mut ppn.get_bytes_array()[start_va.page_offset()..end_va.page_offset()]);
//         }
//         start = end_va.into();
//     }
//     v
// }

///Array of u8 slice that user communicate with os
// pub struct UserBuffer {
//     ///U8 vec
//     pub buffers: Vec<&'static mut [u8]>,
// }

// impl UserBuffer {
//     ///Create a `UserBuffer` by parameter
//     pub fn new(buffers: Vec<&'static mut [u8]>) -> Self {
//         Self { buffers }
//     }
//     ///Length of `UserBuffer`
//     pub fn len(&self) -> usize {
//         let mut total: usize = 0;
//         for b in self.buffers.iter() {
//             total += b.len();
//         }
//         total
//     }
//     /// Write a string to `UserBuffer`, consuming itself
//     /// Return the length of the string written
//     pub fn into_write(self, buf: &str) -> usize {
//         let mut i: usize = 0;
//         let buf = buf.as_bytes();
//         let buf_len = buf.len();
//         for ptr in self.into_iter() {
//             if i >= buf_len {
//                 return i;
//             }
//             unsafe {
//                 *ptr = buf[i];
//             }
//             i += 1;
//         }
//         i
//     }
// }

// impl IntoIterator for UserBuffer {
//     type Item = *mut u8;
//     type IntoIter = UserBufferIterator;
//     fn into_iter(self) -> Self::IntoIter {
//         UserBufferIterator {
//             buffers: self.buffers,
//             current_buffer: 0,
//             current_idx: 0,
//         }
//     }
// }
// /// Iterator of `UserBuffer`
// pub struct UserBufferIterator {
//     buffers: Vec<&'static mut [u8]>,
//     current_buffer: usize,
//     current_idx: usize,
// }

// impl Iterator for UserBufferIterator {
//     type Item = *mut u8;
//     fn next(&mut self) -> Option<Self::Item> {
//         if self.current_buffer >= self.buffers.len() {
//             None
//         } else {
//             let r = &mut self.buffers[self.current_buffer][self.current_idx] as *mut _;
//             if self.current_idx + 1 == self.buffers[self.current_buffer].len() {
//                 self.current_idx = 0;
//                 self.current_buffer += 1;
//             } else {
//                 self.current_idx += 1;
//             }
//             Some(r)
//         }
//     }
// }

#[allow(unused)]
/// read current pagetable's root_ppn in satp
pub fn current_satp() -> PhysPageNum {
    satp::read().bits().into()
}
