//!Implementation of [`TaskManager`]
use super::TaskControlBlock;
use crate::sync::UPSafeCell;
use alloc::collections::VecDeque;
use alloc::sync::Arc;
use async_task::Runnable;
use lazy_static::*;
// pub struct TaskManager {
//     // ready_queue: VecDeque<Arc<TaskControlBlock>>,
//     ready_queue: VecDeque<Runnable>,
// }

// impl TaskManager {
//     ///Creat an empty TaskManager
//     pub fn new() -> Self {
//         Self {
//             ready_queue: VecDeque::new(),
//         }
//     }
//     ///Add a task to `TaskManager`
//     pub fn add(&mut self, task: Arc<TaskControlBlock>) {
//         self.ready_queue.push_back(task);
//     }
//     ///Remove the first task and return it,or `None` if `TaskManager` is empty
//     pub fn fetch(&mut self) -> Option<Arc<TaskControlBlock>> {
//         self.ready_queue.pop_front()
//     }
// }

// lazy_static! {
//     pub static ref TASK_MANAGER: UPSafeCell<TaskManager> =
//         unsafe { UPSafeCell::new(TaskManager::new()) };
// }

// pub fn add_task(task: Arc<TaskControlBlock>) {
//     TASK_MANAGER.exclusive_access().add(task);

// }
// ///Interface offered to pop the first task
// pub fn fetch_task() -> Option<Arc<TaskControlBlock>> {
//     TASK_MANAGER.exclusive_access().fetch()
// }
