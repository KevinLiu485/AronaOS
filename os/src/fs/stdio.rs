//!Stdin & Stdout
use alloc::boxed::Box;

use super::File;
use crate::config::AsyncResult;
use crate::mm::UserBuffer;
use crate::sbi::console_getchar;
use crate::task::yield_task;
///Standard input
pub struct Stdin;
///Standard output
pub struct Stdout;

impl File for Stdin {
    fn readable(&self) -> bool {
        true
    }
    fn writable(&self) -> bool {
        false
    }
    fn read(&self, mut user_buf: UserBuffer) -> AsyncResult<usize> {
        Box::pin(async move {
            assert_eq!(user_buf.len(), 1);
            // busy loop
            let mut c: usize;
            loop {
                c = console_getchar();
                // opensbi returns usize::MAX if no char available
                if c == usize::MAX {
                    yield_task().await;
                    continue;
                } else {
                    break;
                }
            }
            let ch = c as u8;
            unsafe {
                user_buf.buffers[0].as_mut_ptr().write_volatile(ch);
            }
            Ok(1)
        })
    }
    fn write(&self, _user_buf: UserBuffer) -> AsyncResult<usize> {
        panic!("Cannot write to stdin!");
    }
}

impl File for Stdout {
    fn readable(&self) -> bool {
        false
    }
    fn writable(&self) -> bool {
        true
    }
    fn read(&self, _user_buf: UserBuffer) -> AsyncResult<usize> {
        panic!("Cannot read from stdout!");
    }
    fn write(&self, user_buf: UserBuffer) -> AsyncResult<usize> {
        Box::pin(async move {
            for buffer in user_buf.buffers.iter() {
                print!("{}", core::str::from_utf8(*buffer).unwrap());
            }
            Ok(user_buf.len())
        })
    }
}
