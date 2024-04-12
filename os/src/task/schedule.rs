//! Stackless coroutine task scheduler
use core::{
    future::Future,
    pin::Pin,
    task::{Context, Poll},
};

use alloc::sync::Arc;
use log::{debug, info};

use crate::{executor, task::current_task, trap::{trap_handler, trap_return}};

use super::{
    processor::switch_task, task::TaskControlBlock
};

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
    task_ctx: Arc<TaskControlBlock>,
    task_future: F,
}

impl<F: Future + Send + 'static> UserTaskFuture<F> {
    /// Create a new `UserTaskFuture`
    pub fn new(task_control_block: Arc<TaskControlBlock>, task_future: F) -> Self {
        Self {
            task_ctx: task_control_block.clone(),
            task_future,
        }
    }
}

impl<F: Future + Send + 'static> Future for UserTaskFuture<F> {
    type Output = F::Output;

    fn poll(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<Self::Output> {
        let this = unsafe { self.get_unchecked_mut() };
        switch_task(&mut this.task_ctx.clone());
        let ret = unsafe { Pin::new_unchecked(&mut this.task_future).poll(cx) };
        switch_task(&mut this.task_ctx.clone());

        ret
    }
}

// pub struct KernelTaskFuture<F: Future<Output = ()> + Send + 'static> {
//     task_ctx: Arc<TaskControlBlock>,
//     task_future: F,
// }

// impl<F: Future<Output = ()> + Send + 'static> KernelTaskFuture<F> {
//     pub fn new(task: F) -> Self {
//         Self {
//             task_ctx: Arc::new(),
//             task_future: task,
//         }
//     }
// }

// impl<F: Future<Output = ()> + Send + 'static> Future for KernelTaskFuture<F> {
//     type Output = F::Output;

//     fn poll(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<Self::Output> {
//         let this = unsafe { self.get_unchecked_mut() };
//         push_kernel_task();
//         let ret = unsafe { Pin::new_unchecked(&mut this.task_future).poll(cx) };
//         pop_kernel_task();

//         ret
//     }
// }

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

/// Spawn a new kernel thread(used for doing some kernel init work or timed tasks)
// pub fn spawn_kernel_thread<F: Future<Output = ()> + Send + 'static>(kernel_thread: F) {
//     let future = KernelTaskFuture::new(kernel_thread);
//     let (runnable, task) = executor::spawn(future);
//     runnable.schedule();
//     task.detach();
// }

pub async fn thread_loop(task: Arc<TaskControlBlock>) {
    info!("thread_loop(): pid = {}", task.getpid());
    // thread.set_waker(async_utils::take_waker().await);
    // debug!(
    //     "into thread loop, sepc {:#x}, trap cx addr {:#x}",
    //     current_task().trap_context_ref().sepc,
    //     current_task().trap_context_ref() as *const TrapContext as usize
    // );
    loop {
        trap_return();

        // next time when user traps into kernel, it will come back here
        trap_handler().await;

        if task.is_zombie() {
            info!("process terminated, pid = {}", current_task().unwrap().getpid());
            break;
        }
    }
}
