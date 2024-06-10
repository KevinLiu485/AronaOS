//!Implementation of [`TaskControlBlock`]
use super::{pid_alloc, PidHandle};
use crate::fs::path::Path;
use crate::fs::{File, Stdin, Stdout};
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
    pub fd_table: Vec<Option<Arc<dyn File + Send + Sync>>>,
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
    pub fn alloc_fd(&mut self) -> usize {
        if let Some(fd) = (0..self.fd_table.len()).find(|fd| self.fd_table[*fd].is_none()) {
            fd
        } else {
            self.fd_table.push(None);
            self.fd_table.len() - 1
        }
    }
    pub fn reserve_fd(&mut self, fd: usize) {
        if fd >= self.fd_table.len() {
            self.fd_table.resize(fd + 1, None);
        }
    }
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
                fd_table: Vec::new(),
                cwd: Path::new_absolute(),
            }),
        }
    }
    pub fn new(elf_data: &[u8]) -> Self {
        // memory_set with elf program headers/trampoline/trap context/user stack
        let (memory_set, user_sp, entry_point) = MemorySet::from_elf(elf_data);
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
                fd_table: vec![
                    // 0 -> stdin
                    Some(Arc::new(Stdin)),
                    // 1 -> stdout
                    Some(Arc::new(Stdout)),
                    // 2 -> stderr
                    Some(Arc::new(Stdout)),
                ],
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
    pub fn exec(&self, elf_data: &[u8], _args_vec: Vec<String>, _envs_vec: Vec<String>) {
        // memory_set with elf program headers/trampoline/trap context/user stack
        let (memory_set, user_sp, entry_point) = MemorySet::from_elf(elf_data);
        // activate user space
        memory_set.activate();

        info!(
            "[TCB::exec] entry_point: {:x}, user_sp: {:x}",
            entry_point, user_sp
        );

        let kernel_satp = KERNEL_SPACE.lock().token();
        let trap_cx = TrapContext::app_init_context(entry_point, user_sp, kernel_satp);
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
        let memory_set = MemorySet::from_existed_user(&parent_inner.memory_set);
        // COW
        // let memory_set = MemorySet::from_existed_user_lazily(&parent_inner.memory_set);

        //still parent's user space, not child
        parent_inner.memory_set.activate();
        let trap_cx = parent_inner.trap_cx.clone();
        // alloc a pid
        let pid_handle = pid_alloc();
        // copy fd table
        let mut new_fd_table: Vec<Option<Arc<dyn File + Send + Sync>>> = Vec::new();
        for fd in parent_inner.fd_table.iter() {
            if let Some(file) = fd {
                new_fd_table.push(Some(file.clone()));
            } else {
                new_fd_table.push(None);
            }
        }
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
