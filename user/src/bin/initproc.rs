#![no_std]
#![no_main]

use user_lib::{defs::WaitOption, execve, fork, sched_yield, waitpid};

#[macro_use]
extern crate user_lib;

const SHELL: &str = "busybox\0";
// const SHELL: &str = "arona_shell\0";

#[no_mangle]
fn main() -> i32 {
    println!("[initproc] started");
    if fork().expect("[initproc] Fail to fork Arona Shell") == 0 {
        // execve("arona_shell\0", &["arona_shell\0"], &[]).expect("[initproc] Fail to exec Arona Shell");
        execve(SHELL, &[SHELL], &[]).expect("[initproc] Fail to exec Arona Shell");
    } else {
        loop {
            let mut exit_code: i32 = 0;
            match waitpid(-1, &mut exit_code, WaitOption::empty()) {
                Err(erron) => {
                    print!("[initproc] waitpid error: {:?}\n", erron);
                    sched_yield().unwrap();
                    continue;
                }
                Ok(pid) => {
                    println!(
                        "[initproc] Released a zombie process, pid={}, exit_code={}",
                        pid, exit_code
                    );
                }
            }
            // if pid == -1 {
            //     sched_yield();
            //     continue;
            // }
            // println!(
            //     "[initproc] Released a zombie process, pid={}, exit_code={}",
            //     pid, exit_code,
            // );
        }
    }
    0
}
