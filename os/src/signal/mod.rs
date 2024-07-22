mod action;
mod signo;

use action::{ign_sig_handler, term_sig_handler, SignalDefault};
use log::{debug, error, trace, warn};

pub use action::SigHandlers;
pub use signo::*;


use crate::task::task::PROCESS_MANAGER;
use crate::{
    mm::user_check::UserCheck, task::processor::current_thread, utils::SyscallErr, SyscallRet,
    SIG_NUM,
};

bitflags! {
    pub struct SigBitmap: usize {
        const SIGHUP    = 1 << (SIGHUP -1);
        const SIGINT    = 1 << (SIGINT - 1);
        const SIGQUIT   = 1 << (SIGQUIT - 1);
        const SIGILL    = 1 << (SIGILL - 1);
        const SIGTRAP   = 1 << (SIGTRAP - 1);
        const SIGABRT   = 1 << (SIGABRT - 1);
        const SIGBUS    = 1 << (SIGBUS - 1);
        const SIGFPE    = 1 << (SIGFPE - 1);
        const SIGKILL   = 1 << (SIGKILL - 1);
        const SIGUSR1   = 1 << (SIGUSR1 - 1);
        const SIGSEGV   = 1 << (SIGSEGV - 1);
        const SIGUSR2   = 1 << (SIGUSR2 - 1);
        const SIGPIPE   = 1 << (SIGPIPE - 1);
        const SIGALRM   = 1 << (SIGALRM - 1);
        const SIGTERM   = 1 << (SIGTERM - 1);
        const SIGSTKFLT = 1 << (SIGSTKFLT- 1);
        const SIGCHLD   = 1 << (SIGCHLD - 1);
        const SIGCONT   = 1 << (SIGCONT - 1);
        const SIGSTOP   = 1 << (SIGSTOP - 1);
        const SIGTSTP   = 1 << (SIGTSTP - 1);
        const SIGTTIN   = 1 << (SIGTTIN - 1);
        const SIGTTOU   = 1 << (SIGTTOU - 1);
        const SIGURG    = 1 << (SIGURG - 1);
        const SIGXCPU   = 1 << (SIGXCPU - 1);
        const SIGXFSZ   = 1 << (SIGXFSZ - 1);
        const SIGVTALRM = 1 << (SIGVTALRM - 1);
        const SIGPROF   = 1 << (SIGPROF - 1);
        const SIGWINCH  = 1 << (SIGWINCH - 1);
        const SIGIO     = 1 << (SIGIO - 1);
        const SIGPWR    = 1 << (SIGPWR - 1);
        const SIGSYS    = 1 << (SIGSYS - 1);
        const SIGRTMIN  = 1 << (SIGRTMIN- 1);
        const SIGRT_1   = 1 << (SIGRT_1 - 1);
    }
}

/// 每个线程一个
///
#[derive(Clone, Copy)]
pub struct SigSet {
    /// thread signal mask
    ///  A child created via fork initially has a signal mask that is a copy of its parent's signal mask
    /// the signal mask is preserved across an execve
    pub thread_mask: SigBitmap,
    /// pending signals
    /// A child created via fork initially has an empty pending signal set
    /// the pending signal set is preserved across an execve
    pub pending_sigs: SigBitmap,
}

impl SigSet {
    /// empty SigSet
    pub fn new() -> Self {
        Self {
            thread_mask: SigBitmap::empty(),
            pending_sigs: SigBitmap::empty(),
        }
    }
    /// especially used by fork
    /// inherit the parent's signal mask, but clear the pending signals
    pub fn from_existed_user(user_sigset: &SigSet) -> Self {
        Self {
            thread_mask: user_sigset.thread_mask,
            pending_sigs: SigBitmap::empty(),
        }
    }
}

extern "C" {
    pub fn sigreturn_trampoline();
}

pub fn handle_signals() {
    // let process = current_process();
    // let mut inner = process.inner_lock();
    let thread = current_thread().unwrap();
    let inner = thread.get_inner_mut();
    if inner.sig_set.pending_sigs.is_empty() {
        // no pending signals now
        return;
    }
    // 遍历所有信号
    // 编号小的信号优先处理
    for signo in 1..SIG_NUM + 1 {
        if inner
            .sig_set
            .pending_sigs
            .contains(SigBitmap::from_bits(1 << (signo - 1)).unwrap())
            && (!inner
                .sig_set
                .thread_mask
                .contains(SigBitmap::from_bits(1 << (signo - 1)).unwrap()))
        {
            if inner.sig_handlers.sig_handlers[signo].sa_handler == 0 {
                // 未注册 ,由内核处理
                match SignalDefault::get_action(signo) {
                    SignalDefault::Terminate => {
                        // 目前会发生死锁, 应该不是在term_sig_handler中调用exit_current
                        todo!();
                        //term_sig_handler();
                    }
                    SignalDefault::Ignore => {
                        ign_sig_handler();
                    }
                    SignalDefault::Stop => {
                        todo!();
                    }
                    SignalDefault::Cont => {
                        todo!();
                    }
                    SignalDefault::Core => {
                        term_sig_handler();
                    }
                }
                return;
            }
            // user defined handler
            assert!(
                signo != SIGKILL && signo != SIGSTOP,
                "SIGKILL and SIGSTOP cannot be caught or ignored"
            );
            let handler = inner.sig_handlers.sig_handlers[signo];
            if inner.handling_signo == 0
                || !handler
                    .sa_mask
                    .contains(SigBitmap::from_bits(1 << (signo - 1)).unwrap())
            {
                // 该信号未被阻塞, 将调用用户注册的信号处理函数
                // handle flag
                inner.handling_signo = signo;
                inner
                    .sig_set
                    .pending_sigs
                    .remove(SigBitmap::from_bits(1 << (signo - 1)).unwrap());

                // backup the context
                let trap_ctx = inner.get_trap_context();
                inner.signal_context = Some(*trap_ctx);

                // modify trapframe
                trap_ctx.sepc = handler.sa_handler;
                // a0
                trap_ctx.x[10] = signo;
                // ra
                // 6.15debug
                debug!(
                    "sigreturn_trampoline addr: {:#x}",
                    sigreturn_trampoline as usize
                );
                trap_ctx.x[1] = sigreturn_trampoline as usize;
            }
        }
    }
}

pub fn sys_rt_sigerturn() -> SyscallRet {
    debug!("[sys_rt_sigerturn]");
    if let Some(thread) = current_thread() {
        let inner = thread.get_inner_mut();
        inner.handling_signo = 0;
        // restore the trap context
        let trap_ctx = inner.get_trap_context();
        *trap_ctx = inner.signal_context.unwrap();
        Ok(trap_ctx.x[10])
    } else {
        Err(SyscallErr::EUNDEF.into())
    }
}

const SIGBLOCK: i32 = 0;
const SIGUNBLOCK: i32 = 1;
const SIGSETMASK: i32 = 2;

pub fn sys_rt_sigaction(signo: usize, act: usize, old_act: usize) -> SyscallRet {
    trace!(
        "[sys_rt_sigaction]: signo {}, new act ptr {:#x}, old act ptr {:#x}",
        signo,
        act,
        old_act,
    );
    if signo == 0 || signo >= SIG_NUM {
        return Err(SyscallErr::EINVAL.into());
    }
    if signo == SIGKILL || signo == SIGSTOP {
        return Err(SyscallErr::EPERM.into());
    }
    let thread = current_thread().unwrap();
    let inner = thread.get_inner_mut();
    if act != 0 {
        let act = unsafe { &*(act as *const action::SigAction) };
        inner.sig_handlers.sig_handlers[signo] = *act;
    }
    if old_act != 0 {
        // old_act非零说明要求写入旧的信号处理函数到这个地址
        let old_act = unsafe { &mut *(old_act as *mut action::SigAction) };
        *old_act = inner.sig_handlers.sig_handlers[signo];
    }
    Ok(0)
}

/// todo?: 不确定set, old_set的size
/// 现在是当做usize
pub fn sys_rt_sigprocmask(how: i32, set: usize, old_set: usize) -> SyscallRet {
    trace!(
        "[sys_rt_sigprocmask]: how {}, set {:#x}, old_set {:#x}",
        how,
        set,
        old_set,
    );
    let thread = current_thread().unwrap();
    let mut sig_set = thread.get_inner_mut().sig_set;
    if old_set != 0 {
        UserCheck::new()
            .check_writable_pages(old_set as *mut u8, core::mem::size_of::<SigBitmap>())
            .map_err(|_| SyscallErr::EFAULT)?;
        let old_set = unsafe { &mut *(old_set as *mut SigBitmap) };
        *old_set = sig_set.thread_mask;
    }
    if set == 0 {
        debug!("set is null, Ok and do nothing");
        return Ok(0);
    }

    let set = unsafe { SigBitmap::from_bits(*(set as *const usize)).ok_or(SyscallErr::EINVAL)? };
    match how {
        SIGBLOCK => {
            sig_set.thread_mask |= set;
        }
        SIGUNBLOCK => {
            sig_set.thread_mask.remove(set);
        }
        SIGSETMASK => {
            sig_set.thread_mask = set;
        }
        _ => {
            return Err(SyscallErr::EINVAL.into());
        }
    }
    Ok(0)
}

/// pid > 0 then sig is sent to the process with the ID specified by pid
pub fn sys_kill(pid: isize, signo: usize) -> SyscallRet {
    trace!("sys_kill: pid {}, signo {}", pid, signo);
    warn!("[sys_kill] not fully implemented");
    match pid {
        0 => {
            for (_, proc) in PROCESS_MANAGER.lock().0.iter() {
                if let Some(proc) = proc.upgrade() {
                    let sig_info = SigInfo {
                        signo: signo as usize,
                        errno: 0,
                    };
                    debug!(
                        "proc {} send signal {} to proc {}",
                        current_process().pid(),
                        signo,
                        proc.pid()
                    );
                    proc.send_signal(sig_info);
                } else {
                    continue;
                }
            }
        }
        1 => {
            for (_, proc) in PROCESS_MANAGER.lock().0.iter() {
                if let Some(proc) = proc.upgrade() {
                    if proc.pid() == 0 {
                        // init proc
                        continue;
                    }
                    let sig_info = SigInfo {
                        signo: signo as usize,
                        errno: 0,
                    };
                    debug!(
                        "proc {} send signal {} to proc {}",
                        current_process().pid(),
                        signo,
                        proc.pid()
                    );
                    proc.send_signal(sig_info);
                } else {
                    continue;
                }
            }
        }
        _ => {
            let mut pid = pid;
            if pid < 0 {
                pid = -pid;
            }
            if let Some(proc) = PROCESS_MANAGER.lock().0.get(&(pid as usize)) {
                if let Some(proc) = proc.upgrade() {
                    let sig_info = SigInfo {
                        signo: signo as usize,
                        errno: 0,
                    };
                    debug!(
                        "proc {} send signal {} to proc {}",
                        current_process().pid(),
                        signo,
                        proc.pid()
                    );
                    proc.send_signal(sig_info);
                } else {
                    // No such proc
                    return Err(SyscallErr::ESRCH);
                }
            } else {
                // No such proc
                return Err(SyscallErr::ESRCH);
            }
        }
    }
    Ok(0)
}
