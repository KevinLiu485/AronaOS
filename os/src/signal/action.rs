use super::SigBitmap;
use crate::SIG_NUM;

#[derive(Clone)]
pub struct SigHandlers {
    /// handlers[i] is the handler of signal i (index start from 1)
    pub sig_handlers: [SigAction; SIG_NUM + 1],
}

impl SigHandlers {
    pub fn new() -> Self {
        Self {
            sig_handlers: [SigAction::new(); SIG_NUM + 1],
        }
    }
}

/// User defined
#[derive(Clone, Copy)]
pub struct SigAction {
    pub sa_handler: usize,
    // todo?: 使用bitmap!实现
    // 信号处理的flags
    // pub sa_flags: usize,
    /// 存储了sig_return的函数处理地址
    /// 仅在SA_RESTORER标志被设置时有效
    pub sa_restorer: usize,
    /// 执行用户例程期间的信号掩码(需要在信号处理结束后恢复)
    pub sa_mask: SigBitmap,
}

impl SigAction {
    /// empty SigAction
    fn new() -> Self {
        Self {
            sa_handler: 0,
            sa_restorer: 0,
            sa_mask: SigBitmap::empty(),
        }
    }
}
