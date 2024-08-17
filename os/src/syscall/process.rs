use crate::config::SyscallRet;
use crate::fs::path::Path;
use crate::fs::{open_osinode, OpenFlags, AT_FDCWD};
use crate::loader::get_app_data_by_name;
use crate::mm::user_check::UserCheck;
use crate::task::processor::{current_process, current_thread};
use crate::task::{exit_current, yield_task, INITPROC};
use crate::timer::{TimeSpec, TimeoutFuture};
use crate::utils::c_str_to_string;
// use crate::utils::checksum::calculate_checksum;
use alloc::string::{String, ToString};
use alloc::vec::Vec;
use core::future::Future;
use core::ptr::null;
use core::task::Poll;
use core::time::Duration;
use log::{error, info, trace, warn};

/// exit 语义，退出当前的线程。
/// Simply set exit_code and change status to Zombie. More exiting works will de done by its parent.
pub fn sys_exit(exit_code: i32) -> SyscallRet {
    trace!("[sys_exit] enter");
    exit_current(exit_code);
    Ok(0)
}

pub async fn sys_yield() -> SyscallRet {
    trace!("[sys_yield] enter");
    yield_task().await;
    Ok(0)
}

pub async fn sys_nanosleep(time_val_ptr: usize) -> SyscallRet {
    trace!("[sys_nanosleep] enter");
    let sleep_ms = {
        let time_val_ptr = time_val_ptr as *const TimeSpec;
        let time_val = unsafe { &(*time_val_ptr) };
        time_val.sec * 1000 + time_val.nsec / 1000000
    };
    TimeoutFuture::new(Duration::from_millis(sleep_ms as u64)).await
}

pub fn sys_getpid() -> SyscallRet {
    trace!("[sys_getpid] enter");
    Ok(current_thread().unwrap().getpid())
}

pub fn sys_getppid() -> SyscallRet {
    trace!("[sys_getppid] enter");
    let parent_task = current_process().inner_lock().parent.clone();
    match parent_task {
        None => Ok(INITPROC.getpid()),
        Some(parent_task) => match parent_task.upgrade() {
            None => Ok(INITPROC.getpid()),
            Some(parent_task) => Ok(parent_task.getpid()),
        },
    }
}

pub fn sys_fork(stack: Option<usize>) -> SyscallRet {
    trace!("[sys_fork] enter");
    // 复制当前进程
    let current_process = current_process();
    let new_peocess = current_process.fork(stack);

    let new_pid = new_peocess.getpid();
    trace!(
        "[sys_fork] parent pid: {}, new_pid: {}",
        current_process.getpid(),
        new_pid
    );
    Ok(new_pid)
}

pub async fn sys_execve(path: usize, args: usize, envs: usize) -> SyscallRet {
    trace!("[sys_execve] enter");

    let path = Path::from(c_str_to_string(path as *const u8));
    let mut args = args as *const usize;
    let mut envs = envs as *const usize;

    // 下面是手动处理输入的arg
    let mut args_vec: Vec<String> = Vec::new();
    if args != null() {
        loop {
            if unsafe { *args == 0 } {
                break;
            }
            args_vec.push(c_str_to_string(unsafe { (*args) as *const u8 }));
            unsafe {
                args = args.add(1);
            }
        }
    }
    trace!("[sys_exec] path: {}, argv: {:?}", path, args_vec);

    // 下面是手动处理输入的 envs
    let mut envs_vec: Vec<String> = Vec::new();
    if envs != null() {
        if !envs.is_null() {
            loop {
                if unsafe { *envs == 0 } {
                    break;
                }
                envs_vec.push(c_str_to_string(unsafe { (*envs) as *const u8 }));
                unsafe {
                    envs = envs.add(1);
                }
            }
        }
    }

    if let Ok(app_inode) = open_osinode(AT_FDCWD, &path, OpenFlags::RDONLY) {
        // app in fs
        let all_data = app_inode.read_all().await;
        // debug!(
        //     "[sys_exec] app data len: {}, checksum: {}",
        //     all_data.len(),
        //     calculate_checksum(all_data.as_slice())
        // );
        let current_process = current_process();
        current_process.exec(all_data.as_slice(), args_vec, envs_vec);
        Ok(0)
    } else if path.is_global() {
        // app linked in kernel
        if let Some(all_data) = get_app_data_by_name(&path.get_name()) {
            let current_process = current_process();
            current_process.exec(all_data, args_vec, envs_vec);
            Ok(0)
        } else {
            Err(1)
        }
    } else {
        Err(1)
    }
}

bitflags! {
    pub struct WaitOption: i32 {
        /// 这个选项用于非阻塞挂起。当与 wait 或 waitpid 一起使用时，如果没有任何子进程状态改变，
        /// 这些系统调用不会阻塞父进程，而是立即返回。在 Linux 中，如果没有子进程处于可等待的状态，wait 或 waitpid 会返回 0。
        const WNOHANG = 1;
        /// 这个选项告诉 wait 或 waitpid 也报告那些已经停止（stopped），但尚未终止的子进程的状态。默认情况下，
        /// 只有当子进程终止时，它们的结束状态才会被报告。如果子进程被某种信号（如 SIGSTOP 或 SIGTSTP）停止，
        /// 并且父进程没有设置 WUNTRACED 选项，那么父进程将不会感知到子进程的停止状态，直到子进程被继续执行或终止。
        const WUNTRACED = 1 << 1;
        /// 当子进程被停止后又继续执行时，使用这个选项。如果子进程之前被一个停止信号（如SIGSTOP 或 SIGTSTP）暂停，
        /// 然后通过继续信号（如 SIGCONT）被继续执行，那么 wait 或 waitpid 将报告这个子进程的状态，
        /// 即使它还没有终止。这允许父进程知道子进程已经从停止状态恢复。
        const WCONTINUED = 1 << 3;
    }
}

pub async fn sys_wait4(pid: isize, exit_code_ptr: usize, options: i32) -> SyscallRet {
    trace!("[sys_wait4] enter");
    let options = WaitOption::from_bits(options).unwrap();
    WaitFuture::new(options, pid, exit_code_ptr).await
}

pub struct WaitFuture {
    options: WaitOption,
    pid: isize,
    exit_status_addr: usize,
}

impl WaitFuture {
    pub fn new(options: WaitOption, pid: isize, exit_status_addr: usize) -> Self {
        Self {
            options,
            pid,
            exit_status_addr,
        }
    }
}

impl Future for WaitFuture {
    type Output = SyscallRet;
    fn poll(
        self: core::pin::Pin<&mut Self>,
        cx: &mut core::task::Context<'_>,
    ) -> Poll<Self::Output> {
        let process = current_process();
        // let task = current_task().unwrap();
        // find a child process
        // let mut inner = task.get_inner();
        let found_pid;
        let exit_code;

        let mut inner = process.inner_lock();

        if !inner
            .children
            .iter()
            .any(|p| self.pid == -1 || self.pid == p.getpid() as isize)
        {
            return Poll::Ready(Err(1));
        }

        if let Some((idx, _child)) = inner
            .children
            .iter()
            .enumerate()
            .find(|(_, p)| p.is_zombie() && (self.pid == -1 || self.pid == p.getpid() as isize))
        {
            // info!("{}", child.pid.0);
            let child = inner.children.remove(idx);
            // confirm that child will be deallocated after being removed from children list
            found_pid = child.getpid();
            exit_code = child.inner_lock().exit_code;
        } else {
            if self.options.contains(WaitOption::WNOHANG) {
                return Poll::Ready(Ok(0));
            } else {
                cx.waker().wake_by_ref();
                return Poll::Pending;
            }
        }

        drop(inner);
        if self.exit_status_addr != 0 {
            UserCheck::new().check_writable_pages(
                self.exit_status_addr as *mut u8,
                core::mem::size_of::<i32>(),
            )?
        }
        let exit_status_ptr = self.exit_status_addr as *mut i32;
        if exit_status_ptr != core::ptr::null_mut() {
            unsafe {
                exit_status_ptr.write_volatile((exit_code & 0xff) << 8);
            }
        }
        return Poll::Ready(Ok(found_pid));
    }
}

pub fn sys_getcwd(buf: usize, size: usize) -> SyscallRet {
    trace!("[sys_getcwd] enter");
    // let token = current_user_token();
    let task = current_process();
    let cwd = task.inner_handler(|inner| inner.cwd.to_string());
    let len = cwd.len() + 1;
    if buf == 0 {
        // should alloc a buffer
        todo!("[sys_getcwd] alloc a buffer for NULL buf")
    } else if len > size {
        return Err(1);
    }

    // let user_buf = UserBuffer::new(translated_byte_buffer(token, buf as *const u8, len + 1));
    let user_buf = unsafe { core::slice::from_raw_parts_mut(buf as *mut u8, len) };
    user_buf[..len].copy_from_slice((cwd + "\0").as_bytes());
    // user_buf.into_write(&(cwd + "\0"));
    Ok(buf)
}
pub fn sys_clone(
    flags: usize,
    stack_ptr: usize,
    parent_tid_ptr: usize,
    tls_ptr: usize,
    chilren_tid_ptr: usize,
) -> SyscallRet {
    trace!("[sys_clone] enter");
    warn!("[sys_clone] not fully implemented");
    let clone_flags = match CloneFlags::from_bits(flags as u32) {
        None => {
            error!("clone flags is None: {}", flags);
            return Err(22);
        }
        Some(flag) => flag,
    };
    // debug!("[sys_clone] clone flags: {:?}", clone_flags);

    // todo: 检查stack_ptr的是否可写
    let stack = match stack_ptr {
        0 => None,
        stack => {
            info!("[sys_clone] assign the user stack {:#x}", stack);
            Some(stack)
        }
    };

    if clone_flags.contains(CloneFlags::SIGCHLD) || !clone_flags.contains(CloneFlags::CLONE_VM) {
        // fork
        log::info!("[sys_clone] fork");
        sys_fork(stack)
    } else if clone_flags.contains(CloneFlags::CLONE_VM) {
        // clone [create a new thread]
        log::info!("[sys_clone] create thread");
        let new_pid = current_process().clone_thread(
            stack,
            tls_ptr,
            parent_tid_ptr,
            chilren_tid_ptr,
            clone_flags,
        );
        new_pid
    } else {
        unimplemented!("unsupported clone flags")
    }
}

bitflags! {
    /// Open file flags
    pub struct CloneFlags: u32 {
        /// SIGCHLD 是一个信号，在UNIX和类UNIX操作系统中，当一个子进程改变了它的状态时，内核会向其父进程发送这个信号。这个信号可以用来通知父进程子进程已经终止或者停止了。父进程可以采取适当的行动，比如清理资源或者等待子进程的状态。
        /// 以下是SIGCHLD信号的一些常见用途：
        /// 子进程终止：当子进程结束运行时，无论是正常退出还是因为接收到信号而终止，操作系统都会向其父进程发送SIGCHLD信号。
        /// 资源清理：父进程可以处理SIGCHLD信号来执行清理工作，例如释放子进程可能已经使用的资源。
        /// 状态收集：父进程可以通过调用wait()或waitpid()系统调用来获取子进程的终止状态，了解子进程是如何结束的。
        /// 孤儿进程处理：在某些情况下，如果父进程没有适当地处理SIGCHLD信号，子进程可能会变成孤儿进程。孤儿进程最终会被init进程（PID为1的进程）收养，并由init进程来处理其终止。
        /// 避免僵尸进程：通过正确响应SIGCHLD信号，父进程可以避免产生僵尸进程（zombie process）。僵尸进程是已经终止但父进程尚未收集其终止状态的进程。
        /// 默认情况下，SIGCHLD信号的处理方式是忽略，但是开发者可以根据需要设置自定义的信号处理函数来响应这个信号。在多线程程序中，如果需要，也可以将SIGCHLD信号的传递方式设置为线程安全。
        const SIGCHLD = (1 << 4) | (1 << 0);
        /// If CLONE_VM is set, the calling process and the child process run in the same memory space.
        /// In particular, memory writes performed by the calling process or by the child process
        /// are also visible in the other process.  Moreover, any memory mapping or unmapping per‐
        /// formed with mmap(2) or munmap(2) by the child or calling process also affects the other process.
        /// If CLONE_VM is not set, the child process runs in a separate copy of the memory space of
        /// the calling process at the time of the clone call. Memory writes or file mappings/unmappings
        /// performed by one of the processes do not affect the other, as with fork(2).
        const CLONE_VM = 1 << 8;
        const CLONE_FS = 1 << 9;
        const CLONE_FILES = 1 << 10;
        const CLONE_SIGHAND = 1 << 11;
        const CLONE_PIDFD = 1 << 12;
        const CLONE_PTRACE = 1 << 13;
        const CLONE_VFORK = 1 << 14;
        const CLONE_PARENT = 1 << 15;
        const CLONE_THREAD = 1 << 16;
        const CLONE_NEWNS = 1 << 17;
        const CLONE_SYSVSEM = 1 << 18;
        const CLONE_SETTLS = 1 << 19;
        const CLONE_PARENT_SETTID = 1 << 20;
        const CLONE_CHILD_CLEARTID = 1 << 21;
        const CLONE_DETACHED = 1 << 22;
        const CLONE_UNTRACED = 1 << 23;
        const CLONE_CHILD_SETTID = 1 << 24;
        const CLONE_NEWCGROUP = 1 << 25;
        const CLONE_NEWUTS = 1 << 26;
        const CLONE_NEWIPC = 1 << 27;
        const CLONE_NEWUSER = 1 << 28;
        const CLONE_NEWPID = 1 << 29;
        const CLONE_NEWNET = 1 << 30;
        const CLONE_IO = 1 << 31;
    }
}

pub fn sys_set_tid_address(tidptr: *const usize) -> SyscallRet {
    trace!("[sys_set_tid_address] enter, tidptr: {:?}", tidptr);
    warn!("[sys_set_tid_address] not fully implemented");
    // todo: 这里需要检查对应的是否是可写的，如果不可写，直接返回

    let thread = current_thread().unwrap();
    thread.get_inner_mut().tid_addr.clear_tid_address = Some(tidptr as usize);
    Ok(thread.getpid())
}

// pub fn sys_getuid() -> SyscallRet {
//     trace!("[sys_getuid] enter");
//     warn!("[sys_getuid] not implemented");
//     Ok(0)
// }

pub fn sys_exit_group(exit_code: i32) -> SyscallRet {
    trace!("[sys_exit_group] enter");
    exit_current(exit_code);
    Ok(0)
}

// pub fn sys_geteuid() -> SyscallRet {
//     trace!("[sys_geteuid] enter");
//     warn!("[sys_getuid] not implemented");
//     Ok(0)
// }

pub fn sys_getpgid(pid: i32) -> SyscallRet {
    trace!("[sys_getpgid] pid: {}", pid);
    warn!("[sys_getpgid] not fully implemented");
    sys_getpid()
}

pub fn sys_gettid() -> SyscallRet {
    trace!("[sys_gettid] enter");
    warn!("[sys_gettid] not fully implemented");
    sys_getpid()
}

// pub fn sys_sched_getaffinity() -> SyscallRet {
//     trace!("[sys_sched_getaffinity] enter");
//     warn!("[sys_sched_getaffinity] not implemented");
//     Ok(0)
// }

// pub fn sys_sched_getscheduler() -> SyscallRet {
//     trace!("[sys_sched_getscheduler] enter");
//     warn!("[sys_sched_getscheduler] not implemented");
//     Ok(0)
// }

// pub fn sys_sched_getparam() -> SyscallRet {
//     trace!("[sys_sched_getparam] enter");
//     warn!("[sys_sched_getparam] not implemented");
//     Ok(0)
// }

// pub fn sys_sched_setscheduler() -> SyscallRet {
//     trace!("[sys_sched_setscheduler] enter");
//     warn!("[sys_sched_setscheduler] not implemented");
//     Ok(0)
// }
