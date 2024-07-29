#![no_std]
#![no_main]

use user_lib::{defs::OpenFlags, File};
#[allow(unused)]
use user_lib::{defs::WaitOption, execve, fork, sched_yield, waitpid};

#[macro_use]
extern crate user_lib;

#[no_mangle]
fn main() -> i32 {
    let file = File::open(
        "/test_readwrite.txt",
        OpenFlags::CREATE | OpenFlags::RDWR | OpenFlags::TRUNC,
    )
    .expect("[test_readwrite] fail to create test_readwrite.txt");

    let write_buf = [1u8, 2, 3, 4, 5, 6, 7, 8];
    file
        .write(&write_buf)
        .expect("[test_readwrite] fail to write test_readwrite.txt");

    drop(file);

    let file = File::open(
        "/test_readwrite.txt",
        OpenFlags::RDWR,
    )
    .expect("[test_readwrite] fail to create test_readwrite.txt");

    let mut read_buf = [0u8; 8];
    file
        .read(&mut read_buf)
        .expect("[test_readwrite] fail to read test_readwrite.txt");
    println!("[test_readwrite] read_buf: {:?}", read_buf);
    assert_eq!(read_buf, [1u8, 2, 3, 4, 5, 6, 7, 8]);

    println!("[test_readwrite] pass");

    0
}
