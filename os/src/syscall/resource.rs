use crate::config::{SyscallRet, USER_STACK_SIZE};
use crate::mm::user_check::UserCheck;
use crate::task::processor::current_process;
use log::trace;

/// Infinity for RLimit
pub const RLIM_INFINITY: usize = usize::MAX;

/// 实现参考：https://manpages.debian.org/testing/manpages-dev/prlimit64.2.en.html
#[allow(unused)]
const RLIMIT_CPU: u32 = 0; // CPU 时间限制
#[allow(unused)]
const RLIMIT_FSIZE: u32 = 1; // 文件大小限制
#[allow(unused)]
const RLIMIT_DATA: u32 = 2; // 数据段大小限制
#[allow(unused)]
const RLIMIT_STACK: u32 = 3; // 栈大小限制
#[allow(unused)]
const RLIMIT_CORE: u32 = 4; // 核心文件大小限制
#[allow(unused)]
const RLIMIT_RSS: u32 = 5; // 常驻内存大小限制
#[allow(unused)]
const RLIMIT_NPROC: u32 = 6; // 进程数量限制
#[allow(unused)]
const RLIMIT_NOFILE: u32 = 7; // 文件描述符数量限制
#[allow(unused)]
const RLIMIT_MEMLOCK: u32 = 8; // 锁定内存大小限制
#[allow(unused)]
const RLIMIT_AS: u32 = 9; // 地址空间大小限制
#[allow(unused)]
const RLIMIT_LOCKS: u32 = 10; // 文件锁数量限制
#[allow(unused)]
const RLIMIT_SIGPENDING: u32 = 11; // 挂起信号数量限制
#[allow(unused)]
const RLIMIT_MSGQUEUE: u32 = 12; // 消息队列大小限制
#[allow(unused)]
const RLIMIT_NICE: u32 = 13; // 优先级限制
#[allow(unused)]
const RLIMIT_RTPRIO: u32 = 14; // 实时优先级限制
#[allow(unused)]
const RLIMIT_RTTIME: u32 = 15; // 实时时间限制

/// 资源限制结构体
#[derive(Debug, Clone, Copy)]
pub struct RLimit {
    /// 软限制
    pub rlim_cur: usize,
    /// 硬限制（软限制的上限）
    pub rlim_max: usize,
}

impl RLimit {
    /// New a RLimit
    pub fn new(cur: usize, max: usize) -> Self {
        Self {
            rlim_cur: cur,
            rlim_max: max,
        }
    }
    /// Set RLimit
    pub fn set_rlimit(resource: u32, rlimit: &RLimit) -> SyscallRet {
        trace!("[set_rlimit] try to set limit: {:?}", resource);
        match resource {
            RLIMIT_NOFILE => {
                // 设置文件描述符数量限制
                current_process().inner_handler(|proc| proc.fd_table.set_rlimit(*rlimit))
            }
            _ => {
                unimplemented!("[set_rlimit] resource: {:?} not supported", resource)
            }
        }
        Ok(0)
    }
    /// Get RLimit
    pub fn get_rlimit(resource: u32) -> Self {
        match resource {
            // 获取栈大小限制
            RLIMIT_STACK => Self::new(USER_STACK_SIZE, RLIM_INFINITY),
            // 获取文件描述符数量限制
            RLIMIT_NOFILE => current_process().inner_handler(|proc| proc.fd_table.rlimit()),
            _ => {
                unimplemented!("[get_rlimit] resource: {:?} not supported", resource)
            }
        }
    }
}

pub fn sys_prlimit64(
    _pid: usize,              // 进程ID，当前未使用
    resource: u32,            // 资源类型
    new_limit: *const RLimit, // 新的资源限制，指向RLimit结构的指针
    old_limit: *mut RLimit,   // 旧的资源限制，指向可变RLimit结构的指针
) -> SyscallRet {
    // 返回系统调用结果
    trace!("[sys_prlimit64] enter"); // 记录进入函数的日志

    // 如果old_limit不是空指针
    if !old_limit.is_null() {
        // 检查old_limit指向的内存页是否可写
        UserCheck::new()
            .check_writable_pages(old_limit as *mut u8, core::mem::size_of::<RLimit>())?;
        // 获取当前资源限制
        let old_rlimit = RLimit::get_rlimit(resource);
        // 将当前资源限制写入old_limit指向的内存
        unsafe {
            *old_limit = old_rlimit;
        }
    }
    // 如果new_limit是空指针，直接返回成功
    if new_limit.is_null() {
        return Ok(0);
    }
    // todo：检查new_limit指向的内存页是否可读
    // titanix对应代码=> UserCheck::new().check_readable_pages(new_limit as *const u8, core::mem::size_of::<RLimit>())?;

    // 将new_limit解引用为RLimit引用
    let new_rlimit = unsafe { &*new_limit };
    // 检查新的软限制是否超过硬限制
    if new_rlimit.rlim_cur > new_rlimit.rlim_max {
        return Err(22); // EINVAL，表示无效的参数
    }
    // 记录新资源限制的日志
    trace!("[sys_prlimit64] finish: new_rlimit: {:?}", new_rlimit);
    // 设置新的资源限制
    RLimit::set_rlimit(resource, new_rlimit)
}
