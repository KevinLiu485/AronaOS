//!Implementation of [`TaskControlBlock`]
use super::aux::*;
use super::{pid_alloc, PidHandle};
use crate::fs::fd_table::{FdInfo, FdTable};
use crate::fs::path::Path;
use crate::fs::{FileMeta, Stdin, Stdout};
use crate::mm::{MemorySet, KERNEL_SPACE};
use crate::mutex::SpinNoIrqLock;
use crate::trap::TrapContext;
use alloc::string::String;
use alloc::sync::{Arc, Weak};
use alloc::vec;
use alloc::vec::Vec;
use core::ops::DerefMut;
use core::sync::atomic::AtomicBool;
use core::sync::atomic::Ordering::Relaxed;
use log::info;

pub struct TaskControlBlock {
    // immutable
    pub pid: PidHandle,
    pub is_zombie: AtomicBool,
    // mutable
    inner: SpinNoIrqLock<TaskControlBlockInner>,
}

pub struct TaskControlBlockInner {
    pub trap_cx: TrapContext,
    pub base_size: usize,
    pub task_status: TaskStatus,
    pub memory_set: MemorySet,
    pub parent: Option<Weak<TaskControlBlock>>,
    pub children: Vec<Arc<TaskControlBlock>>,
    pub exit_code: i32,
    // pub fd_table: Vec<Option<Arc<dyn File + Send + Sync>>>,
    pub fd_table: FdTable,
    pub cwd: Path,
}

impl TaskControlBlockInner {
    pub fn get_trap_cx(&mut self) -> &'static mut TrapContext {
        unsafe {
            // 先转换为raw pointer绕过rust的borrow检查
            &mut *(&mut self.trap_cx as *mut TrapContext)
        }
    }
    pub fn get_user_token(&self) -> usize {
        self.memory_set.token()
    }
    pub fn get_status(&self) -> TaskStatus {
        self.task_status
    }

    // / alloc lowest-numbered available fd greater than or equal to least_fd
    // pub fn alloc_fd(&mut self, least_fd: usize) -> usize {
    //     if least_fd < self.fd_table.len() {
    //         if let Some(fd) = (0..self.fd_table.len()).find(|fd| self.fd_table[*fd].is_none()) {
    //             fd
    //         } else {
    //             self.fd_table.push(None);
    //             self.fd_table.len() - 1
    //         }
    //     } else {
    //         self.reserve_fd(least_fd);
    //         self.fd_table[least_fd] = None;
    //         least_fd
    //     }
    // }
    // pub fn reserve_fd(&mut self, fd: usize) {
    //     // len is at least (fd + 1)
    //     if fd + 1 > self.fd_table.len() {
    //         self.fd_table.resize(fd + 1, None);
    //     }
    // }
}

impl TaskControlBlock {
    pub fn inner_lock(&self) -> impl DerefMut<Target = TaskControlBlockInner> + '_ {
        self.inner.lock()
    }
    /// Create a wen meaningless TaskControlBlock
    pub fn new_bare() -> Self {
        TaskControlBlock {
            pid: PidHandle(usize::MAX),
            is_zombie: Default::default(),
            inner: SpinNoIrqLock::new(TaskControlBlockInner {
                trap_cx: TrapContext::zero_init(),
                base_size: 0,
                task_status: TaskStatus::Zombie,
                memory_set: MemorySet::new_bare(),
                parent: None,
                children: Vec::new(),
                exit_code: 0,
                fd_table: FdTable::new_bare(),
                cwd: Path::new_absolute(),
            }),
        }
    }
    pub fn new(elf_data: &[u8]) -> Self {
        // memory_set with elf program headers/trampoline/trap context/user stack
        let (memory_set, user_sp, entry_point, _) = MemorySet::from_elf(elf_data);
        // println!("  entry_point: {}", entry_point);
        // alloc a pid and a kernel stack in kernel space
        let pid_handle = pid_alloc();
        // let trap_cx = task_control_block.inner_exclusive_access().get_trap_cx();
        // *trap_cx = TrapContext::app_init_context(entry_point, user_sp, unsafe {
        //     KERNEL_SPACE.as_ref().unwrap().token()
        // });

        let kernel_satp = KERNEL_SPACE.lock().token();

        let trap_cx = TrapContext::app_init_context(entry_point, user_sp, kernel_satp);
        let task_control_block = Self {
            pid: pid_handle,
            is_zombie: Default::default(),
            inner: SpinNoIrqLock::new(TaskControlBlockInner {
                trap_cx,
                base_size: user_sp,
                task_status: TaskStatus::Ready,
                memory_set,
                parent: None,
                children: Vec::new(),
                exit_code: 0,
                fd_table: FdTable::new(vec![
                    // 0 -> stdin
                    // Some(FdInfo{file: Arc::new(Stdin), flags: OpenFlags::empty()}),
                    Some(FdInfo::default_flags(Arc::new(Stdin {
                        meta: FileMeta::new_bare(),
                    }))),
                    // 1 -> stdout
                    // Some(FdInfo{file: Arc::new(Stdout), flags: OpenFlags::empty()}),
                    Some(FdInfo::default_flags(Arc::new(Stdout {
                        meta: FileMeta::new_bare(),
                    }))),
                    // 2 -> stderr
                    // Some(FdInfo{file: Arc::new(Stdout), flags: OpenFlags::empty()}),
                    Some(FdInfo::default_flags(Arc::new(Stdout {
                        meta: FileMeta::new_bare(),
                    }))),
                ]),
                cwd: Path::new_absolute(),
            }),
        };
        // prepare TrapContext in user space
        // let trap_cx = task_control_block.inner_exclusive_access().get_trap_cx();
        // *trap_cx = TrapContext::app_init_context(
        //     entry_point,
        //     user_sp,
        //     KERNEL_SPACE.exclusive_access().token(),
        // );
        task_control_block
    }
    pub fn exec(&self, elf_data: &[u8], args_vec: Vec<String>, envs_vec: Vec<String>) {
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

        let (argv_base, envp_base, auxv_base, user_sp) =
            pass_init_vec(&args_vec, &envs_vec, aux_vec, user_sp);

        let kernel_satp = KERNEL_SPACE.lock().token();
        let mut trap_cx = TrapContext::app_init_context(entry_point, user_sp, kernel_satp);
        // trap_cx.user_x[10] = user_sp;
        // a0 -> argc, a1 -> argv, a2 -> envp
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

        // **** access current TCB exclusively
        let mut inner = self.inner_lock();
        // substitute memory_set
        inner.memory_set = memory_set;
        // update trap_cx
        inner.trap_cx = trap_cx;
    }

    pub fn fork(self: &Arc<TaskControlBlock>, _stack: Option<usize>) -> Arc<TaskControlBlock> {
        // ---- hold parent PCB lock
        let mut parent_inner = self.inner_lock();
        // copy user space(include trap context)
        //let memory_set = MemorySet::from_existed_user(&parent_inner.memory_set);
        let memory_set = MemorySet::from_existed_user_lazily(&parent_inner.memory_set);
        info!(
            "[TCB::fork] parent pagtbl: {:x}, child pagtbl: {:x}",
            parent_inner.memory_set.token(),
            memory_set.token()
        );

        //still parent's user space, not child
        parent_inner.memory_set.activate();
        let trap_cx = parent_inner.trap_cx.clone();
        // alloc a pid
        let pid_handle = pid_alloc();
        // copy fd table
        // let mut new_fd_table: Vec<Option<Arc<dyn File + Send + Sync>>> = Vec::new();
        // let mut new_fd_table = FdTable::new_bare();
        // // for fd in parent_inner.fd_table.iter() {
        // for fd in parent_inner.fd_table.table.iter() {
        //     if let Some(file) = fd {
        //         new_fd_table.table.push(Some(file.clone()));
        //     } else {
        //         new_fd_table.table.push(None);
        //     }
        // }
        let new_fd_table = parent_inner.fd_table.exec_clone();
        // inherit cwd
        let cwd = parent_inner.cwd.clone();
        let task_control_block = Arc::new(TaskControlBlock {
            pid: pid_handle,
            is_zombie: Default::default(),
            inner: SpinNoIrqLock::new(TaskControlBlockInner {
                trap_cx,
                base_size: parent_inner.base_size,
                task_status: TaskStatus::Ready,
                memory_set,
                parent: Some(Arc::downgrade(self)),
                children: Vec::new(),
                exit_code: 0,
                fd_table: new_fd_table,
                cwd,
            }),
        });
        // add child
        parent_inner.children.push(task_control_block.clone());
        // modify kernel_sp in trap_cx
        // return
        task_control_block
        // ---- release parent PCB
    }
    pub fn getpid(&self) -> usize {
        self.pid.0
    }
    pub fn is_zombie(&self) -> bool {
        self.is_zombie.load(Relaxed)
    }
    /// We can get whatever we want in the inner by providing a handler
    pub fn inner_handler<T>(&self, f: impl FnOnce(&mut TaskControlBlockInner) -> T) -> T {
        f(&mut self.inner.lock())
    }
}

impl TaskControlBlock {
    /// for debug purpose
    pub fn print_all_task(&self, indent: String) {
        println!("{}{}", indent, self.pid.0);
        unsafe {
            for child in self.inner.unsafe_get().children.iter() {
                child.print_all_task(indent.clone() + "  ")
            }
        }
    }
}

#[derive(Copy, Clone, PartialEq)]
pub enum TaskStatus {
    Ready,
    Running,
    Zombie,
}

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
