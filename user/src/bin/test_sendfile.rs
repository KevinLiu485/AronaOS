#![no_std]
#![no_main]

use user_lib::{defs::{OpenFlags, SEEK_SET}, sendfile, File};
#[allow(unused)]
use user_lib::{defs::WaitOption, execve, fork, sched_yield, waitpid};

#[macro_use]
extern crate user_lib;

#[no_mangle]
fn main() -> i32 {
    let file_src = File::open(
        "/test.txt",
        OpenFlags::CREATE | OpenFlags::RDWR | OpenFlags::TRUNC,
    )
    .expect("[test_sendfile] fail to create test.txt");

    let write_buf = [1u8, 2, 3, 4, 5, 6, 7, 8];
    file_src
        .write(&write_buf)
        .expect("[test_sendfile] fail to write test.txt");

    // let mut read_buf = [0u8; 8];
    // file_src
    //     .read(&mut read_buf)
    //     .expect("[test_sendfile] fail to read test.txt");
    // println!("[test_sendfile] read_buf: {:?}", read_buf);
    // assert_eq!(read_buf, [1u8, 2, 3, 4, 5, 6, 7, 8]);

    let file_dst = File::open("/test_sendfile.txt", OpenFlags::CREATE | OpenFlags::RDWR)
        .expect("[test_sendfile] fail to create test_sendfile.txt");

    let mut offset = 4;
    let ret =
        sendfile(&file_dst, &file_src, &mut offset, 4).expect("[test_sendfile] fail to sendfile");

    file_dst.lseek(0, SEEK_SET).expect("[test_sendfile] fail to lseek test.txt");

    let mut read_buf = [0u8; 8];
    file_dst
        .read(&mut read_buf)
        .expect("[test_sendfile] fail to read test_sendfile.txt");

    println!(
        "[test_sendfile] ret: {}, offset: {}, read_buf: {:?}",
        ret, offset, read_buf
    );
    assert_eq!(ret, 4);
    assert_eq!(offset, 8);
    assert_eq!(read_buf, [5u8, 6, 7, 8, 0, 0, 0, 0]);
    println!("[test_sendfile] pass");

    0
}
