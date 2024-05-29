//! ffi

use crate::mm::MapPermission;
///
pub const NSEC_PER_SEC: usize = 10_0000_0000;

/// sys_uname
#[repr(C)]
pub struct Utsname {
    /// 系统名称
    pub sysname: [u8; 65],
    /// 网络上主机名称
    pub nodename: [u8; 65],
    /// 发行编号
    pub release: [u8; 65],
    /// 版本
    pub version: [u8; 65],
    /// 域名
    pub machine: [u8; 65],
}

impl Default for Utsname {
    fn default() -> Self {
        Self {
            sysname: Self::from_str("Aronaos"),
            nodename: Self::from_str("LAPTOP"),
            release: Self::from_str("5.15.146.1-standard"),
            version: Self::from_str("#1 SMP Thu Jan"),
            machine: Self::from_str("RISC-V SiFive Freedom U740 SoC"),
        }
    }
}

impl Utsname {
    fn from_str(info: &str) -> [u8; 65] {
        let mut data: [u8; 65] = [0; 65];
        data[..info.len()].copy_from_slice(info.as_bytes());
        data
    }
}

/// sys_times, 单位都是us
#[repr(C)]
pub struct Tms {
    /// CPU time spent executing instructions of the calling process
    pub utime: usize,
    /// inside the kernel
    pub stime: usize,
    /// the sum of the utime for all waited-for teminated children
    pub cutime: usize,
    /// the sum of stime for all waited-for teminated children
    pub cstime: usize,
}

impl Default for Tms {
    fn default() -> Self {
        Self {
            utime: 1,
            stime: 1,
            cutime: 1,
            cstime: 1,
        }
    }
}

/// sys_gettimeofday, current time = sec + usec
#[repr(C)]
#[derive(Debug, Clone, Copy)]
pub struct TimeVal {
    /// seconds
    pub sec: usize,
    /// microseconds
    pub usec: usize,
}

/// sys_nanosleep
#[repr(C)]
#[derive(Clone, Copy, Debug, Default)]
pub struct TimeSecs {
    /// seconds
    pub tv_sec: usize,
    /// nanoseconds
    pub tv_nsec: usize,
}

bitflags! {
    /// MMAP memeory protection
    pub struct MMAPPROT: u32 {
        /// Readable
        const PROT_READ = 1 << 0;
        /// Writeable
        const PROT_WRITE = 1 << 1;
        /// Executable
        const PROT_EXEC = 1 << 2;
    }
}

impl From<MMAPPROT> for MapPermission {
    fn from(prot: MMAPPROT) -> Self {
        let mut map_permission = MapPermission::from_bits(0).unwrap();
        if prot.contains(MMAPPROT::PROT_READ) {
            map_permission |= MapPermission::R;
        }
        if prot.contains(MMAPPROT::PROT_WRITE) {
            map_permission |= MapPermission::W;
        }
        if prot.contains(MMAPPROT::PROT_EXEC) {
            map_permission |= MapPermission::X;
        }
        map_permission
    }
}

bitflags! {
    /// determines whether updates to the mapping are visible to other processes mapping the same region, and whether
    /// updates are carried through to the underlying file.
    pub struct MMAPFLAGS: u32 {
        /// MAP_SHARED
        const MAP_SHARED = 1 << 0;
        /// MAP_PRIVATE
        const MAP_PRIVATE = 1 << 1;
        /// 以上两种只能选一
        /// MAP_FIXED, 一定要映射到addr, 不是作为hint, 要取消原来位置的映射
        const MAP_FIXED = 1 << 4;
        /// MAP_ANONYMOUS, 需要fd为-1, offset为0
        const MAP_ANONYMOUS = 1 << 5;
    }
}
