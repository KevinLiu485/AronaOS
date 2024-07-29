use super::signo::*;
use super::SigBitmap;
use crate::{task::exit_current, SIG_NUM};
use log::debug;

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

/// 没有显式指定处理函数时的默认行为
pub enum SignalDefault {
    /// 终止进程
    Terminate,
    /// 忽略信号
    Ignore,
    /// 终止进程并转储核心，即程序当时的内存状态记录下来，保存在一个文件中，但当前未实现保存，直接退出进程
    Core,
    /// 暂停进程执行
    Stop,
    /// 恢复进程执行
    Cont,
}

impl SignalDefault {
    /// Get the default action of a signal
    pub fn get_action(signo: usize) -> Self {
        match signo {
            SIGABRT => Self::Core,
            SIGALRM => Self::Terminate,
            SIGBUS => Self::Core,
            SIGCHLD => Self::Ignore,
            SIGCONT => Self::Cont,
            SIGFPE => Self::Core,
            SIGHUP => Self::Terminate,
            SIGILL => Self::Core,
            SIGINT => Self::Terminate,
            SIGKILL => Self::Terminate,
            SIGPIPE => Self::Terminate,
            SIGQUIT => Self::Core,
            SIGSEGV => Self::Core,
            SIGSTOP => Self::Stop,
            SIGTERM => Self::Terminate,
            SIGTSTP => Self::Stop,
            SIGTTIN => Self::Stop,
            SIGTTOU => Self::Stop,
            SIGUSR1 => Self::Terminate,
            SIGUSR2 => Self::Terminate,
            SIGXCPU => Self::Core,
            SIGXFSZ => Self::Core,
            SIGVTALRM => Self::Terminate,
            SIGPROF => Self::Terminate,
            SIGWINCH => Self::Ignore,
            SIGIO => Self::Terminate,
            SIGPWR => Self::Terminate,
            SIGSYS => Self::Core,
            _ => Self::Terminate,
        }
    }
}

pub fn ign_sig_handler() {
    debug!("ignore this sig");
}

pub fn term_sig_handler() {
    debug!("term sig handler");
    exit_current(-1);
}
