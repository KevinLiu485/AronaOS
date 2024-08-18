//!Implementation of [`Thread`]
use super::aux::*;
use super::processor::current_thread_uncheck;
use super::{current_trap_cx, id_alloc, IdHandle};
use crate::config::SyscallRet;
use crate::fs::fd_table::{FdInfo, FdTable};
use crate::fs::path::Path;
use crate::fs::tty::TtyFile;
// use crate::fs::FileMeta;
use crate::mm::{MemorySet, KERNEL_SPACE};
use crate::mutex::SpinNoIrqLock;
use crate::signal::{SigBitmap, SigHandlers, SigSet};
use crate::syscall::process::CloneFlags;
use crate::task::processor::current_thread;
use crate::task::schedule::spawn_thread;
use crate::trap::TrapContext;
use alloc::collections::BTreeMap;
use alloc::string::String;
use alloc::sync::{Arc, Weak};
use alloc::vec;
use alloc::vec::Vec;
use core::cell::UnsafeCell;
use core::ops::DerefMut;
use core::sync::atomic::AtomicBool;
use core::sync::atomic::Ordering::Relaxed;
use lazy_static::lazy_static;
use log::info;

lazy_static! {
    /// 包括PROCESS，以及thread的
    pub static ref PROCESS_MANAGER: SpinNoIrqLock<BTreeMap<usize, Weak<Process>>> =
        SpinNoIrqLock::new(BTreeMap::new());
}

/// ['Process'] 负责管理进程资源的单位，有着自己的Thread都共享的资源，本身并不参与调度
/// 记录了主线程，以保持以前现有进程的一致性
pub struct Process {
    pub pid: Arc<IdHandle>,    // 自己的main thread的pid也是这个 id（加arc的原因）
    pub is_zombie: AtomicBool, // 这个放到inner外面主要是为了防止死锁
    pub inner: SpinNoIrqLock<ProcessInner>,
}

impl Process {
    /// get Main thread (Process)
    pub fn main_thread(&self) -> Arc<Thread> {
        self.inner
            .lock()
            .threads
            .get(&self.getpid())
            .unwrap()
            .upgrade()
            .unwrap()
    }
    /// Get the process's pid
    pub fn getpid(&self) -> usize {
        self.pid.0
    }
    pub fn inner_handler<T>(&self, f: impl FnOnce(&mut ProcessInner) -> T) -> T {
        f(&mut self.inner.lock())
    }
    pub fn inner_lock(&self) -> impl DerefMut<Target = ProcessInner> + '_ {
        self.inner.lock()
    }
    pub fn is_zombie(&self) -> bool {
        self.is_zombie.load(Relaxed)
    }
    pub fn get_exit_code(&self) -> i32 {
        self.inner.lock().exit_code
    }
    pub fn get_pgid(&self) -> usize {
        self.inner.lock().pgid
    }

    pub fn send_signal(&self, signo: usize) {
        for (_, thread) in self.inner.lock().threads.iter_mut() {
            let task = thread.upgrade().unwrap();
            task.send_signal(signo)
        }
    }

    pub fn print_all_task(&self, indent: String) {
        println!("{}process:{}", indent, self.pid.0);

        unsafe {
            for (pid, _thread) in self.inner.unsafe_get().threads.iter() {
                println!("{}--Thread{}", indent, pid);
            }
            for child in self.inner.unsafe_get().children.iter() {
                child.print_all_task(indent.clone() + "  ")
            }
        }
    }

    pub fn manual_alloc_for_lazy(&self, addr: VirtAddr) -> Result<(), crate::utils::SyscallErr> {
        let vpn = addr.floor();
        self.inner.lock().memory_set.manual_alloc_for_lazy(vpn)
    }

    /// 目前的语义，主线程切换到另一个任务，其余的所有线程直接kill了。【注意不是当前线程，而是主线程】
    pub fn exec(&self, elf_data: &[u8], args_vec: Vec<String>, envs_vec: Vec<String>) {
        // exec 对原来的线程主要干三件事情
        // 1- 修改memory set （process 层面）
        // 2- 新建trap_context，设置ustack_top （thread 层面）
        // 3- 压入一些初始参数 （a0 -> argc, a1 -> argv, a2 -> envp....）

        // memory_set with elf program headers/trampoline/trap context/user stack
        let (memory_set, user_sp, entry_point, aux_vec) = MemorySet::from_elf(elf_data);
        // activate user space
        memory_set.activate();
        info!(
            "[TCB::exec] entry_point: {:x}, user_sp: {:x}, page_table: {:x}",
            entry_point,
            user_sp,
            memory_set.token()
        );
        // 读取对应的参数
        let (argv_base, envp_base, auxv_base, user_sp) =
            pass_init_vec(&args_vec, &envs_vec, aux_vec, user_sp);

        // 新建trap_context
        let kernel_satp = KERNEL_SPACE.lock().token();
        let mut trap_cx = TrapContext::app_init_context(entry_point, user_sp, kernel_satp);

        // 传入对应的参数a0 -> argc, a1 -> argv, a2 -> envp，
        trap_cx.x[10] = args_vec.len();
        trap_cx.x[11] = argv_base;
        trap_cx.x[12] = envp_base;
        trap_cx.x[13] = auxv_base;
        info!(
            "[TCB::exec] a0(argc) {:#x}, a1(argv) {:#x}, a2(envp) {:#x} a3(auxv) {:#x} sp {:#x}",
            args_vec.len(),
            argv_base,
            envp_base,
            auxv_base,
            trap_cx.x[2],
        );

        // 修改memory set
        self.inner_lock().memory_set = memory_set;

        // 修改main thread 的trap_context
        let main_thread_inner = unsafe { &mut (*self.main_thread().inner.get()) };
        main_thread_inner.ustack_top = user_sp;
        main_thread_inner.trap_context = trap_cx;
        // todo: 相关的传参，需要搬到对应的user_sp里面的，而且对应的参数都需要构造
    }

    /// fork由于是完全复制，需要进行两个操作
    /// 1- 复制进程资源（其中新分配pid）,并挂载到父进程中
    /// 2- 新建主线程
    pub fn fork(self: &Arc<Self>, stack: Option<usize>) -> Arc<Process> {
        /*-------- 进程信息的复制与挂载 -------*/
        let mut parent_inner = self.inner_lock();
        // copy user space(include trap context)
        let memory_set = MemorySet::from_existed_user_lazily(&parent_inner.memory_set);
        info!(
            "[TCB::fork] parent pagtbl: {:x}, child pagtbl: {:x}",
            parent_inner.memory_set.token(),
            memory_set.token()
        );
        // still parent's user space, not child
        parent_inner.memory_set.activate();

        // 分配新的pid
        let pid_handle = Arc::new(id_alloc());
        // 复制进程资源
        let child = Arc::new(Self {
            pid: pid_handle.clone(),
            is_zombie: Default::default(),
            inner: SpinNoIrqLock::new(ProcessInner {
                parent: Some(Arc::downgrade(self)),
                memory_set,
                children: Vec::new(),
                exit_code: 0,
                fd_table: parent_inner.fd_table.exec_clone(), // 复制 fd table
                cwd: parent_inner.cwd.clone(),                // 继承 cwd
                threads: BTreeMap::new(),
                pgid: parent_inner.pgid, // todo: fork暂时的继承了分组
            }),
        });
        // 子进程挂载到父进程下
        parent_inner.children.push(child.clone());

        /*--------线程的复制与加入内核线程-------*/
        // 复制线程
        let child_main_thread = Arc::new(Thread::thread_fork(
            &current_thread().unwrap(),
            child.clone(),
            stack,
            pid_handle,
        ));
        // 主线程需要记录自己的main thread
        child
            .inner_lock()
            .threads
            .insert(child_main_thread.tid.0, Arc::downgrade(&child_main_thread));

        // 因为信号，加到线程统一管理
        PROCESS_MANAGER
            .lock()
            .insert(child.pid.0, Arc::downgrade(&child));

        // fork本身的操作，就不交给thread_loop模块了 （指的就是返回值为0）
        child_main_thread.get_trap_context_mut().x[10] = 0;
        spawn_thread(child_main_thread);
        child
    }

    pub fn clone_thread(
        self: &Arc<Self>,
        stack: Option<usize>,
        tls_ptr: usize,
        parent_tid_ptr: usize,
        child_tid_ptr: usize,
        flags: CloneFlags,
    ) -> SyscallRet {
        let stack = stack.expect("clone stack should not be 0");
        let entry_point = unsafe { *(stack as *const usize) };
        let arg = unsafe {
            let arg_addr = stack + core::mem::size_of::<usize>();
            *(arg_addr as *const usize)
        };
        // 设置新的trap context
        let mut trap_context = *current_trap_cx();
        // 设置 spec
        trap_context.set_entry_point(entry_point);
        trap_context.set_return_value(arg);
        // 设置 stack pointer
        trap_context.set_sp(stack);
        // 设置 线程本地变量的指向指针
        trap_context.set_thread_pointer(tls_ptr);
        // 设置 全局指针
        trap_context.set_global_pointer(current_trap_cx().get_global_pointer()); // Global pointer

        // 新建一个线程
        let pid = Arc::new(id_alloc());
        let new_thread = Arc::new(Thread::new(
            self.clone(),
            current_thread(),
            trap_context,
            stack,
            pid.clone(),
        ));

        // attach the new thread to process
        let mut parent_inner = self.inner_lock();
        parent_inner
            .threads
            .insert(pid.0, Arc::downgrade(&new_thread));

        if flags.contains(CloneFlags::CLONE_CHILD_CLEARTID) {
            new_thread.get_inner_mut().tid_addr.clear_tid_address = Some(child_tid_ptr);
        }
        if flags.contains(CloneFlags::CLONE_CHILD_SETTID) {
            unsafe {
                *(child_tid_ptr as *mut usize) = pid.0;
            }
        }
        if flags.contains(CloneFlags::CLONE_PARENT_SETTID) {
            unsafe {
                *(parent_tid_ptr as *mut usize) = pid.0;
            }
        }
        spawn_thread(new_thread);
        Ok(pid.0)
    }
}

pub fn new_initproc(elf_data: &[u8]) -> Arc<Thread> {
    // memory_set with elf program headers/trampoline/trap context/user stack
    let (memory_set, user_sp, entry_point, _) = MemorySet::from_elf(elf_data);
    // println!("  entry_point: {}", entry_point);
    let kernel_satp = KERNEL_SPACE.lock().token();
    // alloc a pid and a kernel stack in kernel space
    let pid_handle = Arc::new(id_alloc());

    let process = Arc::new(Process {
        pid: pid_handle.clone(),
        is_zombie: Default::default(),
        inner: SpinNoIrqLock::new(ProcessInner {
            memory_set,
            parent: None,
            children: Vec::new(),
            exit_code: 0,
            fd_table: FdTable::new(vec![
                // 0 -> stdin
                // Some(FdInfo{file: Arc::new(Stdin), flags: OpenFlags::empty()}),
                // Some(FdInfo::default_flags(Arc::new(Stdin {
                //     meta: FileMeta::new_bare(),
                // }))),
                // 1 -> stdout
                // Some(FdInfo{file: Arc::new(Stdout), flags: OpenFlags::empty()}),
                // Some(FdInfo::default_flags(Arc::new(Stdout {
                //     meta: FileMeta::new_bare(),
                // }))),
                // 2 -> stderr
                // Some(FdInfo{file: Arc::new(Stdout), flags: OpenFlags::empty()}),
                // Some(FdInfo::default_flags(Arc::new(Stdout {
                //     meta: FileMeta::new_bare(),
                // }))),
                // 0 -> stdin
                // Some(FdInfo{file: Arc::new(Stdin), flags: OpenFlags::empty()}),
                Some(FdInfo::default_flags(Arc::new(TtyFile::new(true, false)))),
                // 1 -> stdout
                // Some(FdInfo{file: Arc::new(Stdout), flags: OpenFlags::empty()}),
                Some(FdInfo::default_flags(Arc::new(TtyFile::new(false, true)))),
                // 2 -> stderr
                // Some(FdInfo{file: Arc::new(Stdout), flags: OpenFlags::empty()}),
                Some(FdInfo::default_flags(Arc::new(TtyFile::new(false, true)))),
            ]),
            cwd: Path::root(),
            threads: Default::default(),
            pgid: 0,
        }),
    });

    let trap_cx = TrapContext::app_init_context(entry_point, user_sp, kernel_satp);
    let thread = Arc::new(Thread::new(
        process.clone(),
        None,
        trap_cx,
        user_sp,
        pid_handle,
    ));

    process
        .inner
        .lock()
        .threads
        .insert(thread.get_tid(), Arc::downgrade(&thread));
    PROCESS_MANAGER
        .lock()
        .insert(process.getpid(), Arc::downgrade(&process));
    // todo: group manager

    log::info!(
        "[new_initproc] create a new process, pid {}",
        process.getpid()
    );
    thread
}

pub struct ProcessInner {
    pub parent: Option<Weak<Process>>,

    pub memory_set: MemorySet,
    pub children: Vec<Arc<Process>>,
    /// Exit code of the current process Note that we may need to put this member in every thread
    pub exit_code: i32,
    pub fd_table: FdTable,
    pub cwd: Path,

    pub threads: BTreeMap<usize, Weak<Thread>>,
    /// gid, the process group id
    pub pgid: usize,
}

impl ProcessInner {
    pub fn get_user_token(&self) -> usize {
        self.memory_set.token()
    }
}

/// The reference type of a task
pub type TaskRef = Arc<Thread>;

/// [‘Thread’] 调度和任务执行的基本单位，有主线程（类似原本进程的语义）和普通线程的区分
/// process 自己共享的资源
pub struct Thread {
    /// immutable
    tid: Arc<IdHandle>,
    /// 自己属于的进程
    pub process: Arc<Process>,
    /// mutable
    pub is_terminated: AtomicBool,
    ///
    pub inner: UnsafeCell<ThreadInner>,
}

impl Thread {
    pub fn do_terminate(&self) {
        self.is_terminated.store(true, Relaxed);
    }

    pub fn get_inner_mut(&self) -> &mut ThreadInner {
        unsafe { &mut (*self.inner.get()) }
    }

    pub fn is_zombie(&self) -> bool {
        self.is_terminated.load(Relaxed)
    }

    pub fn set_clear_address(&mut self, tidptr: usize) {
        self.get_inner_mut().tid_addr.clear_tid_address = Some(tidptr);
    }

    pub fn get_tid(&self) -> usize {
        self.tid.0
    }

    pub fn send_signal(&self, signo: usize) {
        self.get_inner_mut()
            .sig_set
            .pending_sigs
            .insert(SigBitmap::from_bits(1 << (signo - 1)).unwrap())
    }

    pub fn have_signals(&self) -> bool {
        !self.get_inner_mut().sig_set.pending_sigs.is_empty()
    }

    /// Get the mutable ref of trap context
    pub fn get_trap_context_mut(&self) -> &mut TrapContext {
        unsafe { &mut (*self.inner.get()).trap_context }
    }

    pub fn new(
        process: Arc<Process>,
        main_thread: Option<Arc<Thread>>,
        trap_context: TrapContext,
        ustack_top: usize,
        tid: Arc<IdHandle>,
    ) -> Self {
        // todo: main thread 这里有一个信号的操作
        let sig_set;
        let sig_handlers;
        match main_thread {
            Some(main_thread) => {
                sig_set = SigSet::from_existed_user(&main_thread.get_inner_mut().sig_set);
                sig_handlers = main_thread.get_inner_mut().sig_handlers.clone();
            }
            None => {
                sig_set = SigSet::new();
                sig_handlers = SigHandlers::new();
            }
        };

        let thread = Self {
            tid: tid.clone(),
            is_terminated: Default::default(),
            process: process.clone(),
            // user_specified_stack,
            inner: UnsafeCell::new(ThreadInner {
                trap_context,
                ustack_top,
                tid_addr: TidAddress::new(),
                sig_set,
                sig_handlers,
                signal_context: None,
                handling_signo: 0,
            }),
        };

        PROCESS_MANAGER
            .lock()
            .insert(tid.0, Arc::downgrade(&process));
        thread
    }

    /// fork一个已有线程
    /// - stack pointer设置了，就用设置的 stack pointer
    /// - process 为父进程
    /// - pid 父进程的 pid
    pub fn thread_fork(
        another: &Arc<Thread>,
        new_process: Arc<Process>,
        stack: Option<usize>,
        pid: Arc<IdHandle>,
    ) -> Self {
        Self {
            tid: pid.clone(),
            is_terminated: Default::default(),
            process: new_process.clone(),
            inner: UnsafeCell::new(ThreadInner {
                trap_context: {
                    let mut trap_context = unsafe { (*another.inner.get()).trap_context };
                    if let Some(stack) = stack {
                        trap_context.set_sp(stack);
                    }
                    trap_context
                },
                ustack_top: unsafe { (*another.inner.get()).ustack_top },
                tid_addr: TidAddress::new(),
                sig_set: SigSet::from_existed_user(&another.get_inner_mut().sig_set),
                sig_handlers: another.get_inner_mut().sig_handlers.clone(),
                signal_context: None,
                handling_signo: 0,
            }),
        }
    }
}

pub struct ThreadInner {
    pub trap_context: TrapContext,
    pub ustack_top: usize,

    pub signal_context: Option<TrapContext>,
    pub handling_signo: usize,
    pub sig_set: SigSet,
    pub sig_handlers: SigHandlers,

    /// Tid address, which may be modified by `set_tid_address` syscall
    pub tid_addr: TidAddress,
}

impl ThreadInner {
    pub fn get_trap_context(&mut self) -> &'static mut TrapContext {
        unsafe {
            // 先转换为raw pointer绕过rust的borrow检查
            &mut *(&mut self.trap_context as *mut TrapContext)
        }
    }
}

unsafe impl Send for Thread {}
unsafe impl Sync for Thread {}

/// pass `Process Initial Vector`(i.e. argv, envp, auxv + argc) to user space, at the top of the user stack, above user sp.
/// returns changed user_sp
fn pass_init_vec(
    args_vec: &Vec<String>,
    envs_vec: &Vec<String>,
    mut auxs_vec: Vec<AuxHeader>,
    mut user_sp: usize,
) -> (usize, usize, usize, usize) {
    // argv is a vector of each arg's addr
    let mut argv = vec![0; args_vec.len()];
    // envp is a vector of each env's addr
    let mut envp = vec![0; envs_vec.len()];

    // Copy each env to the newly allocated stack
    for i in 0..envs_vec.len() {
        // Here we leave one byte to store a '\0' as a terminator
        user_sp -= envs_vec[i].len() + 1;
        // UserCheck::new().check_writable_slice(user_sp as *mut u8, envs_vec[i].len() + 1)?;
        let p = user_sp as *mut u8;
        unsafe {
            envp[i] = user_sp;
            p.copy_from(envs_vec[i].as_ptr(), envs_vec[i].len());
            *((p as usize + envs_vec[i].len()) as *mut u8) = 0;
        }
    }
    user_sp -= user_sp % core::mem::size_of::<usize>();

    // stack_trace!();
    // Copy each arg to the newly allocated stack
    for i in 0..args_vec.len() {
        // Here we leave one byte to store a '\0' as a terminator
        user_sp -= args_vec[i].len() + 1;
        // UserCheck::new().check_writable_slice(user_sp as *mut u8, args_vec[i].len() + 1)?;
        let p = user_sp as *mut u8;
        unsafe {
            argv[i] = user_sp;
            p.copy_from(args_vec[i].as_ptr(), args_vec[i].len());
            *((p as usize + args_vec[i].len()) as *mut u8) = 0;
        }
    }
    user_sp -= user_sp % core::mem::size_of::<usize>();

    // stack_trace!();

    // Copy `platform`
    let platform = "RISC-V64";
    user_sp -= platform.len() + 1;
    user_sp -= user_sp % core::mem::size_of::<usize>();
    let p = user_sp as *mut u8;
    // UserCheck::new().check_writable_slice(p as *mut u8, platform.len())?;
    unsafe {
        p.copy_from(platform.as_ptr(), platform.len());
        *((p as usize + platform.len()) as *mut u8) = 0;
    }

    // stack_trace!();
    // Copy 16 random bytes(here is 0)
    user_sp -= 16;
    // UserCheck::new().check_writable_slice(user_sp as *mut u8, 16)?;
    auxs_vec.push(AuxHeader {
        aux_type: AT_RANDOM,
        value: user_sp,
    });

    // stack_trace!();
    // Padding
    user_sp -= user_sp % 16;

    auxs_vec.push(AuxHeader {
        aux_type: AT_EXECFN,
        value: argv[0],
    }); // file name
    auxs_vec.push(AuxHeader {
        aux_type: AT_NULL,
        value: 0,
    }); // end

    // stack_trace!();
    // Construct auxv
    // info!("[pass_init_vec] auxv len {}", auxs_vec.len());
    let len = auxs_vec.len() * core::mem::size_of::<AuxHeader>();
    user_sp -= len;
    // UserCheck::new().check_writable_slice(user_sp as *mut u8, len)?;
    let auxv_base = user_sp;
    for i in 0..auxs_vec.len() {
        unsafe {
            // *((user_sp + i * core::mem::size_of::<AuxHeader>()) as *mut AuxHeader) = auxs[i];
            *((user_sp + i * core::mem::size_of::<AuxHeader>()) as *mut usize) =
                auxs_vec[i].aux_type;
            *((user_sp + i * core::mem::size_of::<AuxHeader>() + core::mem::size_of::<usize>())
                as *mut usize) = auxs_vec[i].value;
        }
    }
    // stack_trace!();
    // Construct envp
    let len = (envs_vec.len() + 1) * core::mem::size_of::<usize>();
    user_sp -= len;
    // UserCheck::new().check_writable_slice(user_sp as *mut u8, len)?;
    let envp_base = user_sp;
    for i in 0..envs_vec.len() {
        unsafe {
            *((envp_base + i * core::mem::size_of::<usize>()) as *mut usize) = envp[i];
        }
    }
    unsafe {
        *((envp_base + envs_vec.len() * core::mem::size_of::<usize>()) as *mut usize) = 0;
    }
    // Construct argv
    let len = (args_vec.len() + 1) * core::mem::size_of::<usize>();
    user_sp -= len;
    // UserCheck::new().check_writable_slice(user_sp as *mut u8, len)?;
    let argv_base = user_sp;
    for i in 0..args_vec.len() {
        unsafe {
            *((argv_base + i * core::mem::size_of::<usize>()) as *mut usize) = argv[i];
        }
    }
    unsafe {
        *((argv_base + args_vec.len() * core::mem::size_of::<usize>()) as *mut usize) = 0;
    }
    // We save the argc just below the argv_base.
    // Note that this is required by POSIX
    user_sp -= core::mem::size_of::<usize>();
    // UserCheck::new().check_writable_slice(user_sp as *mut u8, core::mem::size_of::<usize>())?;
    // write argc
    unsafe {
        *(user_sp as *mut usize) = args_vec.len();
    }
    (argv_base, envp_base, auxv_base, user_sp)
}

impl TidAddress {
    pub fn new() -> Self {
        Self {
            set_tid_address: None,
            clear_tid_address: None,
        }
    }
}

pub struct TidAddress {
    /// Set tid address
    pub set_tid_address: Option<usize>,
    /// Clear tid address
    pub clear_tid_address: Option<usize>,
}

pub fn current_have_signals() -> bool {
    current_thread_uncheck().have_signals()
}
