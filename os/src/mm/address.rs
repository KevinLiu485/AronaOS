//! Implementation of physical and virtual address and page number.

use super::PageTableEntry;
use crate::config::{KERNEL_BASE, PAGE_SIZE, PAGE_SIZE_BITS};
use core::fmt::{self, Debug, Display, Formatter};
use core::ops::Sub;

const PA_WIDTH_SV39: usize = 56;
const VA_WIDTH_SV39: usize = 39;
const PPN_WIDTH_SV39: usize = PA_WIDTH_SV39 - PAGE_SIZE_BITS;
const VPN_WIDTH_SV39: usize = VA_WIDTH_SV39 - PAGE_SIZE_BITS;

/// Definitions

#[derive(Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
pub struct KernelAddr(pub usize);

/// physical page address
#[repr(C)]
#[derive(Copy, Clone, Ord, PartialOrd, Eq, PartialEq)]
pub struct PhysAddr(pub usize);

#[repr(C)]
#[derive(Copy, Clone, Ord, PartialOrd, Eq, PartialEq)]
///virtual address
pub struct VirtAddr(pub usize);

#[repr(C)]
#[derive(Copy, Clone, Ord, PartialOrd, Eq, PartialEq)]
///phiscal page number
pub struct PhysPageNum(pub usize);

#[repr(C)]
#[derive(Copy, Clone, Ord, PartialOrd, Eq, PartialEq)]
///virtual page number
pub struct VirtPageNum(pub usize);

impl Sub<VirtPageNum> for VirtPageNum {
    type Output = isize;

    fn sub(self, rhs: VirtPageNum) -> Self::Output {
        self.0 as isize - rhs.0 as isize
    }
}

/// Debugging

impl Debug for KernelAddr {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        f.write_fmt(format_args!("KA:{:#x}", self.0))
    }
}
impl Debug for VirtAddr {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        f.write_fmt(format_args!("VA:{:#x}", self.0))
    }
}
impl Debug for VirtPageNum {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        f.write_fmt(format_args!("VPN:{:#x}", self.0))
    }
}
impl Debug for PhysAddr {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        f.write_fmt(format_args!("PA:{:#x}", self.0))
    }
}
impl Debug for PhysPageNum {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        f.write_fmt(format_args!("PPN:{:#x}", self.0))
    }
}

/// T: {PhysAddr, VirtAddr, PhysPageNum, VirtPageNum}
/// T -> usize: T.0
/// usize -> T: usize.into()

impl From<usize> for KernelAddr {
    fn from(v: usize) -> Self {
        Self(v)
    }
}

impl From<usize> for PhysAddr {
    fn from(v: usize) -> Self {
        Self(v & ((1 << PA_WIDTH_SV39) - 1))
    }
}
impl From<usize> for PhysPageNum {
    fn from(v: usize) -> Self {
        Self(v & ((1 << PPN_WIDTH_SV39) - 1))
    }
}
impl From<usize> for VirtAddr {
    fn from(v: usize) -> Self {
        Self(v & ((1 << VA_WIDTH_SV39) - 1))
    }
}
impl From<usize> for VirtPageNum {
    fn from(v: usize) -> Self {
        Self(v & ((1 << VPN_WIDTH_SV39) - 1))
    }
}
impl From<KernelAddr> for usize {
    fn from(ka: KernelAddr) -> Self {
        ka.0
    }
}
impl From<PhysAddr> for usize {
    fn from(v: PhysAddr) -> Self {
        v.0
    }
}
impl From<PhysPageNum> for usize {
    fn from(v: PhysPageNum) -> Self {
        v.0
    }
}
impl From<VirtAddr> for usize {
    fn from(v: VirtAddr) -> Self {
        if v.0 >= (1 << (VA_WIDTH_SV39 - 1)) {
            v.0 | (!((1 << VA_WIDTH_SV39) - 1))
        } else {
            v.0
        }
    }
}
impl From<VirtPageNum> for usize {
    fn from(v: VirtPageNum) -> Self {
        v.0
    }
}
///
impl VirtAddr {
    ///`VirtAddr`->`VirtPageNum`
    pub fn floor(&self) -> VirtPageNum {
        VirtPageNum(self.0 / PAGE_SIZE)
    }
    ///`VirtAddr`->`VirtPageNum`
    pub fn ceil(&self) -> VirtPageNum {
        if self.0 == 0 {
            VirtPageNum(0)
        } else {
            VirtPageNum((self.0 - 1 + PAGE_SIZE) / PAGE_SIZE)
        }
    }
    ///Get page offset
    pub fn page_offset(&self) -> usize {
        self.0 & (PAGE_SIZE - 1)
    }
    ///Check page aligned
    pub fn aligned(&self) -> bool {
        self.page_offset() == 0
    }
}
impl From<VirtAddr> for VirtPageNum {
    fn from(v: VirtAddr) -> Self {
        assert_eq!(v.page_offset(), 0);
        v.floor()
    }
}
impl From<VirtPageNum> for VirtAddr {
    fn from(v: VirtPageNum) -> Self {
        Self(v.0 << PAGE_SIZE_BITS)
    }
}
impl PhysAddr {
    ///`PhysAddr`->`PhysPageNum`
    pub fn floor(&self) -> PhysPageNum {
        PhysPageNum(self.0 / PAGE_SIZE)
    }
    ///`PhysAddr`->`PhysPageNum`
    pub fn ceil(&self) -> PhysPageNum {
        if self.0 == 0 {
            PhysPageNum(0)
        } else {
            PhysPageNum((self.0 - 1 + PAGE_SIZE) / PAGE_SIZE)
        }
    }
    ///Get page offset
    pub fn page_offset(&self) -> usize {
        self.0 & (PAGE_SIZE - 1)
    }
    ///Check page aligned
    pub fn aligned(&self) -> bool {
        self.page_offset() == 0
    }
}
impl From<PhysAddr> for PhysPageNum {
    fn from(v: PhysAddr) -> Self {
        assert_eq!(v.page_offset(), 0);
        v.floor()
    }
}
impl From<PhysPageNum> for PhysAddr {
    fn from(v: PhysPageNum) -> Self {
        Self(v.0 << PAGE_SIZE_BITS)
    }
}

impl From<PhysPageNum> for KernelAddr {
    fn from(ppn: PhysPageNum) -> Self {
        Self((ppn.0 << PAGE_SIZE_BITS) + KERNEL_BASE)
    }
}

impl From<KernelAddr> for PhysPageNum {
    fn from(ka: KernelAddr) -> Self {
        PhysAddr(ka.0 - KERNEL_BASE).floor()
    }
}

impl From<KernelAddr> for PhysAddr {
    fn from(ka: KernelAddr) -> Self {
        Self(ka.0 - KERNEL_BASE)
    }
}

impl VirtPageNum {
    ///Return VPN 3 level index
    pub fn indexes(&self) -> [usize; 3] {
        let mut vpn = self.0;
        let mut idx = [0usize; 3];
        for i in (0..3).rev() {
            idx[i] = vpn & 511;
            vpn >>= 9;
        }
        idx
    }
}

// 不再有直接通过pa访问物理页帧的能力, 而是由ka负责
impl PhysAddr {
    ///Get reference to `PhysAddr` value
    pub fn get_ref<T>(&self) -> &'static T {
        unsafe { (KernelAddr::from(self.0).0 as *const T).as_ref().unwrap() }
    }
    ///Get mutable reference to `PhysAddr` value
    pub fn get_mut<T>(&self) -> &'static mut T {
        unsafe { (KernelAddr::from(self.0).0 as *mut T).as_mut().unwrap() }
    }
}

impl KernelAddr {
    ///Get reference to `KernelAddr` value
    pub fn get_ref<T>(&self) -> &'static T {
        unsafe { (self.0 as *const T).as_ref().unwrap() }
    }
    ///Get mutable reference to `KernelAddr` value
    pub fn get_mut<T>(&self) -> &'static mut T {
        unsafe { (self.0 as *mut T).as_mut().unwrap() }
    }
}

// 直接获取物理页帧的方式是通过KernelAddr
impl PhysPageNum {
    ///Get `PageTableEntry` on `PhysPageNum`
    pub fn get_pte_array(&self) -> &'static mut [PageTableEntry] {
        let ka: KernelAddr = (*self).into();
        unsafe { core::slice::from_raw_parts_mut(ka.0 as *mut PageTableEntry, 512) }
    }
    ///Get u8 array on `PhysPageNum`
    pub fn get_bytes_array(&self) -> &'static mut [u8] {
        let ka: KernelAddr = (*self).into();
        unsafe { core::slice::from_raw_parts_mut(ka.0 as *mut u8, 4096) }
    }
    ///Get Get mutable reference to `PhysAddr` value on `PhysPageNum`
    pub fn get_mut<T>(&self) -> &'static mut T {
        let ka: KernelAddr = (*self).into();
        ka.get_mut()
    }
}
///Add value by one
pub trait StepByOne {
    ///Add value by one
    fn step(&mut self);
}
impl StepByOne for VirtPageNum {
    fn step(&mut self) {
        self.0 += 1;
    }
}
impl StepByOne for PhysPageNum {
    fn step(&mut self) {
        self.0 += 1;
    }
}

#[derive(Copy, Clone)]
/// a simple range structure for type T
pub struct SimpleRange<T>
where
    T: StepByOne + Copy + PartialEq + PartialOrd + Debug,
{
    l: T,
    r: T,
}
impl<T> SimpleRange<T>
where
    T: StepByOne + Copy + PartialEq + PartialOrd + Debug,
{
    pub fn new(start: T, end: T) -> Self {
        assert!(start <= end, "start {:?} > end {:?}!", start, end);
        Self { l: start, r: end }
    }
    pub fn get_start(&self) -> T {
        self.l
    }
    pub fn get_end(&self) -> T {
        self.r
    }
    pub fn update_end(&mut self, new_end: T) {
        self.r = new_end;
    }
}
impl<T> IntoIterator for SimpleRange<T>
where
    T: StepByOne + Copy + PartialEq + PartialOrd + Debug,
{
    type Item = T;
    type IntoIter = SimpleRangeIterator<T>;
    fn into_iter(self) -> Self::IntoIter {
        SimpleRangeIterator::new(self.l, self.r)
    }
}
/// iterator for the simple range structure
pub struct SimpleRangeIterator<T>
where
    T: StepByOne + Copy + PartialEq + PartialOrd + Debug,
{
    current: T,
    end: T,
}
impl<T> SimpleRangeIterator<T>
where
    T: StepByOne + Copy + PartialEq + PartialOrd + Debug,
{
    pub fn new(l: T, r: T) -> Self {
        Self { current: l, end: r }
    }
}
impl<T> Iterator for SimpleRangeIterator<T>
where
    T: StepByOne + Copy + PartialEq + PartialOrd + Debug,
{
    type Item = T;
    fn next(&mut self) -> Option<Self::Item> {
        if self.current == self.end {
            None
        } else {
            let t = self.current;
            self.current.step();
            Some(t)
        }
    }
}
/// a simple range structure for virtual page number
pub type VPNRange = SimpleRange<VirtPageNum>;

impl VPNRange {
    /// check whether the given range is overlap with self
    pub fn is_overlap(self, other: VPNRange) -> bool {
        self.get_start() < other.get_end() && self.get_end() > other.get_start()
    }
    /// check whether the given virtual page number is in self
    /// used for page fault handler
    pub fn contains(self, other: VirtPageNum) -> bool {
        self.get_start() <= other && other < self.get_end()
    }
}

impl Display for VPNRange {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        write!(f, "[{:?}, {:?})", self.get_start(), self.get_end())
    }
}
