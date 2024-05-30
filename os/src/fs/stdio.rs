//!Stdin & Stdout
use alloc::boxed::Box;

use super::{File, FileMeta};
use crate::config::AsyncResult;
// use crate::mm::UserBuffer;
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
    fn read<'a>(&'a self, buf: &'a mut [u8]) -> AsyncResult<usize> {
        Box::pin(async move {
            assert_eq!(buf.len(), 1);
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
                // buf.buffers[0].as_mut_ptr().write_volatile(ch);
                buf.as_mut_ptr().write_volatile(ch);
            }
            Ok(1)
        })
    }
    fn write(&self, _buf: &[u8]) -> AsyncResult<usize> {
        panic!("Cannot write to stdin!");
    }
    fn get_meta(&self) -> FileMeta {
        FileMeta::new(None, 0)
    }
    fn seek(&self, _offset: usize) {
        panic!("Cannot seek stdin!");
    }
}

impl File for Stdout {
    fn readable(&self) -> bool {
        false
    }
    fn writable(&self) -> bool {
        true
    }
    fn read(&self, _buf: &mut [u8]) -> AsyncResult<usize> {
        panic!("Cannot read from stdout!");
    }
    fn write<'a>(&'a self, buf: &'a [u8]) -> AsyncResult<usize> {
        Box::pin(async move {
            // for buffer in user_buf.buffers.iter() {
            //     print!("{}", core::str::from_utf8(*buffer).unwrap());
            // }
            print!("{}", core::str::from_utf8(buf).unwrap());
            Ok(buf.len())
        })
    }
    fn get_meta(&self) -> FileMeta {
        FileMeta::new(None, 0)
    }
    fn seek(&self, _offset: usize) {
        panic!("Cannot seek stdout!");
    }
}
