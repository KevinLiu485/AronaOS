#![no_std]
#![no_main]

use user_lib::{defs::WaitOption, execve, fork, waitpid};

extern crate user_lib;

const CMDS: [&[&str; 2]; 4] = [
    // &["./time-test\0", "\0"],
    // &["./busybox_testcode.sh\0", "\0"],
    // &["./libctest_testcode.sh", "\0"],
    // &["./libc-bench", "\0"],
    // &["./lua_testcode.sh", "\0"],
    // &["./unixbench_testcode.sh", "\0"],
    &["splice-test-1", "\0"],
    &["splice-test-2", "\0"],
    &["splice-test-3", "\0"],
    &["splice-test-4", "\0"],
];
#[no_mangle]
pub fn main() -> i32 {
    for cmd in CMDS.iter() {
        let pid = fork().unwrap();
        if pid == 0 {
            execve(cmd[0], *cmd, &["\0"]).unwrap();
            panic!("unreachable!");
        } else {
            let mut exit_code = 0;
            let _wait_pid = waitpid(pid as i32, &mut exit_code, WaitOption::empty()).unwrap();
        }
    }
    return 0;
}