//!Implementation of [`TaskControlBlock`]
use super::{pid_alloc, PidHandle};
use crate::fs::{File, Stdin, Stdout};
use crate::mm::{MemorySet, PhysPageNum, VirtAddr, KERNEL_SPACE};
use crate::sync::UPSafeCell;
use crate::trap::{trap_handler, TrapContext};
use alloc::sync::{Arc, Weak};
use alloc::vec;
use alloc::vec::Vec;
use core::cell::RefMut;
use log::error;

pub struct TaskControlBlock {
    // immutable
    pub pid: PidHandle,
    // mutable
    // Todo*: temp pub for debug, need to be private
    pub inner: UPSafeCell<TaskControlBlockInner>,
}

pub struct TaskControlBlockInner {
    //pub trap_cx_ppn: PhysPageNum,
    pub trap_cx: TrapContext,
    pub base_size: usize,
    pub task_status: TaskStatus,
    pub memory_set: MemorySet,
    pub parent: Option<Weak<TaskControlBlock>>,
    pub children: Vec<Arc<TaskControlBlock>>,
    pub exit_code: i32,
    pub fd_table: Vec<Option<Arc<dyn File + Send + Sync>>>,
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
    fn get_status(&self) -> TaskStatus {
        self.task_status
    }
    pub fn is_zombie(&self) -> bool {
        self.get_status() == TaskStatus::Zombie
    }
    pub fn alloc_fd(&mut self) -> usize {
        if let Some(fd) = (0..self.fd_table.len()).find(|fd| self.fd_table[*fd].is_none()) {
            fd
        } else {
            self.fd_table.push(None);
            self.fd_table.len() - 1
        }
    }
}

impl TaskControlBlock {
    pub fn inner_exclusive_access(&self) -> RefMut<'_, TaskControlBlockInner> {
        self.inner.exclusive_access()
    }
    /// Create a wen meaningless TaskControlBlock
    pub fn new_bare() -> Self {
        TaskControlBlock {
            pid: PidHandle(usize::MAX),
            inner: unsafe {
                UPSafeCell::new(TaskControlBlockInner {
                    trap_cx: TrapContext::zero_init(),
                    base_size: 0,
                    task_status: TaskStatus::Zombie,
                    memory_set: MemorySet::new_bare(),
                    parent: None,
                    children: Vec::new(),
                    exit_code: 0,
                    fd_table: Vec::new(),
                })
            },
        }
    }
    pub fn new(elf_data: &[u8]) -> Self {
        // memory_set with elf program headers/trampoline/trap context/user stack
        let (memory_set, user_sp, entry_point) = MemorySet::from_elf(elf_data);
        println!("  entry_point: {}", entry_point);
        // alloc a pid and a kernel stack in kernel space
        let pid_handle = pid_alloc();
        // let trap_cx = task_control_block.inner_exclusive_access().get_trap_cx();
        // *trap_cx = TrapContext::app_init_context(entry_point, user_sp, unsafe {
        //     KERNEL_SPACE.as_ref().unwrap().token()
        // });
        let kernel_satp = unsafe { KERNEL_SPACE.as_ref().unwrap().token() };
        let trap_cx = TrapContext::app_init_context(entry_point, user_sp, kernel_satp);
        let task_control_block = Self {
            pid: pid_handle,
            inner: unsafe {
                UPSafeCell::new(TaskControlBlockInner {
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
                })
            },
        };
        // prepare TrapContext in user space
        task_control_block
    }
    pub fn exec(&self, elf_data: &[u8]) {
        // memory_set with elf program headers/trampoline/trap context/user stack
        let (memory_set, user_sp, entry_point) = MemorySet::from_elf(elf_data);
        // activate user space
        memory_set.activate();
        error!("current page_table root_ppn: {:?}", crate::current_satp());

        let kernel_satp = unsafe { KERNEL_SPACE.as_ref().unwrap().token() };
        let trap_cx = TrapContext::app_init_context(entry_point, user_sp, kernel_satp);
        // **** access current TCB exclusively
        let mut inner = self.inner_exclusive_access();
        // substitute memory_set
        inner.memory_set = memory_set;
        // update trap_cx ppn
        inner.trap_cx = trap_cx;
    }
    pub fn fork(self: &Arc<TaskControlBlock>) -> Arc<TaskControlBlock> {
        // ---- hold parent PCB lock
        let mut parent_inner = self.inner_exclusive_access();
        // copy user space(include trap context)
        let memory_set = MemorySet::from_existed_user(&parent_inner.memory_set);

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
        let task_control_block = Arc::new(TaskControlBlock {
            pid: pid_handle,
            inner: unsafe {
                UPSafeCell::new(TaskControlBlockInner {
                    trap_cx,
                    base_size: parent_inner.base_size,
                    task_status: TaskStatus::Ready,
                    memory_set,
                    parent: Some(Arc::downgrade(self)),
                    children: Vec::new(),
                    exit_code: 0,
                    fd_table: new_fd_table,
                })
            },
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
        self.inner_exclusive_access().is_zombie()
    }
}

#[derive(Copy, Clone, PartialEq)]
pub enum TaskStatus {
    Ready,
    Running,
    Zombie,
}
