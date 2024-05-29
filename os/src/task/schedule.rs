//! Stackless coroutine task scheduler
use core::{
    future::Future,
    pin::Pin,
    task::{Context, Poll},
};

use alloc::sync::Arc;
use log::{debug, info, warn};
use log::info;

use crate::{
    executor,
    task::current_task,
    trap::{trap_handler, trap_return},
};

use super::{processor::switch_task, task::TaskControlBlock};

/// A future that yields the current thread when firstly polled
pub struct YieldFuture(pub bool);

impl Future for YieldFuture {
    type Output = ();

    fn poll(mut self: Pin<&mut Self>, cx: &mut Context) -> Poll<Self::Output> {
        if self.0 {
            return Poll::Ready(());
        }
        self.0 = true;
        // Wake up this future, which means putting this thread into
        // the tail of the task queue
        cx.waker().wake_by_ref();
        Poll::Pending
    }
}

/// A future that runs a user task
pub struct UserTaskFuture<F: Future + Send + 'static> {
    task_ctx: Option<Arc<TaskControlBlock>>,
    task_future: F,
}

impl<F: Future + Send + 'static> UserTaskFuture<F> {
    /// Create a new `UserTaskFuture`
    pub fn new(task_control_block: Arc<TaskControlBlock>, task_future: F) -> Self {
        Self {
            task_ctx: Some(task_control_block.clone()),
            task_future,
        }
    }
}

impl<F: Future + Send + 'static> Future for UserTaskFuture<F> {
    type Output = F::Output;

    fn poll(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<Self::Output> {
        let this = unsafe { self.get_unchecked_mut() };

        // switch status
        // let task = current_task().unwrap();
        // let mut inner = task.inner_exclusive_access();
        // assert!(
        //     inner.get_status() == TaskStatus::Ready,
        //     "UserTaskFuture::poll(): Wrong status, expected Ready"
        // );
        // inner.task_status = TaskStatus::Running;
        // drop(inner);
        // drop(task);

        switch_task(&mut this.task_ctx.clone());
        // run `threadloop`
        let ret = unsafe { Pin::new_unchecked(&mut this.task_future).poll(cx) };
        switch_task(&mut this.task_ctx.clone());

        // switch status
        // let task = current_task().unwrap();
        // let mut inner = task.inner_exclusive_access();
        // assert!(
        //     inner.get_status() == TaskStatus::Running,
        //     "UserTaskFuture::poll(): Wrong status, expected Running"
        // );
        // inner.task_status = TaskStatus::Ready;

        ret
    }
}

/// Yield the current thread (and the scheduler will switch to next thread)
pub async fn yield_task() {
    YieldFuture(false).await;
}

/// Spawn a new user thread
pub fn spawn_thread(task_control_block: Arc<TaskControlBlock>) {
    let future = UserTaskFuture::new(task_control_block.clone(), thread_loop(task_control_block));
    let (runnable, task) = executor::spawn(future);
    runnable.schedule();
    task.detach();
}

/// The main loop of a user thread
pub async fn thread_loop(task: Arc<TaskControlBlock>) {
    loop {
        trap_return();

        // next time when user traps into kernel, it will come back here
        trap_handler().await;
        // debug!("thread_loop(): back from trap_handler");
        if task.is_zombie() {
            warn!(
                "process terminated, pid = {}",
                current_task().unwrap().getpid()
            );
            break;
        }
    }
}
