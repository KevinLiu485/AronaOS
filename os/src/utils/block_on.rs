//! A simple implementation of `block_on` future executor.

use core::future::Future;
use core::task::{Context, Poll, RawWaker, RawWakerVTable, Waker};

pub fn block_on<F: Future>(mut future: F) -> F::Output {
    let vtable = &RawWakerVTable::new(clone, do_nothing, do_nothing, do_nothing);
    let raw_waker = RawWaker::new(core::ptr::null(), vtable);
    let waker = unsafe { Waker::from_raw(raw_waker) };
    let mut context = Context::from_waker(&waker);

    loop {
        match unsafe { core::pin::Pin::new_unchecked(&mut future) }.poll(&mut context) {
            Poll::Ready(value) => return value,
            Poll::Pending => continue,
        }
    }
}

unsafe fn clone(_data: *const ()) -> RawWaker {
    let vtable = &RawWakerVTable::new(clone, do_nothing, do_nothing, do_nothing);
    RawWaker::new(core::ptr::null(), vtable)
}

unsafe fn do_nothing(_: *const ()) {}

// Usage:
// let future = async { /* ... */ };
// let result = block_on(future);
