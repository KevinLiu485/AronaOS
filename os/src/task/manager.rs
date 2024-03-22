use super::TaskControlBlock;
use crate::sync::UPSafeCell;
use alloc::collections::VecDeque;
use alloc::sync::Arc;
use lazy_static::*;

/// [`TaskManager`]
/// [`TaskControlBlock`] 的双端队列，thread-safe
pub struct TaskManager {
    ready_queue: VecDeque<Arc<TaskControlBlock>>,
}

/// FIFO scheduler todo：之后改装到GMP
impl TaskManager {
    /// 创建一个双端队列
    pub fn new() -> Self {
        Self {
            ready_queue: VecDeque::new(),
        }
    }
    /// 给队列添加一个TCB
    pub fn add_tcb(&mut self, task: Arc<TaskControlBlock>) {
        self.ready_queue.push_back(task);
    }
    ///Remove the first task and return it,or `None` if `TaskManager` is empty
    pub fn fetch_tcb(&mut self) -> Option<Arc<TaskControlBlock>> {
        self.ready_queue.pop_front()
    }
}

lazy_static! {
    pub static ref TASK_MANAGER: UPSafeCell<TaskManager> =
        unsafe { UPSafeCell::new(TaskManager::new()) };
}

/// 添加任务的一个抽象层
pub fn add_task(task: Arc<TaskControlBlock>) {
    TASK_MANAGER.exclusive_access().add_tcb(task);
}
/// 获取任务的一个抽象层
pub fn fetch_task() -> Option<Arc<TaskControlBlock>> {
    TASK_MANAGER.exclusive_access().fetch_tcb()
}
