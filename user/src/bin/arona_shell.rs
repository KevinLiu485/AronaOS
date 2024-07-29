#![no_std]
#![no_main]
#![allow(clippy::println_empty_string)]

extern crate alloc;

#[macro_use]
extern crate user_lib;
extern crate spin;

mod shell;

use alloc::
    string::{String, ToString}
;
use shell::{command::Command, history::History, timer::Timer};
use shell::*;
use spin::{Lazy, Mutex};
use user_lib::{
    chdir,
    console::getchar,
    defs::WaitOption,
    exit, fork, getcwd, waitpid,
};

static TIMER: Lazy<Mutex<Timer>> = Lazy::new(|| Mutex::new(Timer::new()));

static HISTORY: Lazy<Mutex<History>> = Lazy::new(|| Mutex::new(History::new()));

fn inner_cmd(cmd: &mut Command) -> bool {
    match cmd.get_name() {
        "exit" | "quit" | "shutdown" => {
            println!("{}Goodbye, sensei!{}", THEME_COLOR, RESET_COLOR);
            exit(0);
        }
        "cd" => {
            match cmd.get_args().first() {
                Some(path) => {
                    if chdir(path).is_err() {
                        println!("[Arona] Sorry, Arona cannot found path {}", path);
                    }
                }
                None => {
                    println!("[Arona] Please tell me where to go, sensei...");
                }
            }
            true
        }
        "history" => {
            HISTORY.lock().print();
            true
        }
        "ls" => {
            *cmd = Command::from("/busybox ls");
            false   // continue to exec
        }
        _ => false,
    }
}

fn parse(line: &str) {
    let mut cmd = Command::from(line);
    if inner_cmd(&mut cmd) {
        return;
    }
    let pid = fork().unwrap();
    if pid == 0 {
        // child process
        cmd.exec();
    } else {
        // parent process
        let mut exit_code: i32 = 0;
        match waitpid(pid as i32, &mut exit_code, WaitOption::empty()) {
            Ok(exit_pid) => {
                assert_eq!(pid, exit_pid as u32);
                println!("[Arona] Process {} exited with code {}", pid, exit_code);
            }
            Err(erron) => {
                println!("[Arona] Some error occurs to waitpid...: {:?}", erron);
            }
        }
    }
}

fn print_prompt() {
    print!(
        "{}{} ms\n@Arona:{} >> {}",
        THEME_COLOR,
        TIMER.lock().elapsed_ms(),
        getcwd().unwrap_or("".to_string()),
        RESET_COLOR
    );
}

fn clear_screen_line(line: &str) {
    for _ in 0..line.len() {
        print!("{} {}", BS as char, BS as char);
    }
}

#[no_mangle]
pub fn main() -> i32 {
    // println!("{}おかえりなさい、先生!{}", THEME_COLOR, RESET_COLOR);
    println!("{}Welcome to Arona OS, sensei!{}", THEME_COLOR, RESET_COLOR);
    let mut line: String = String::new();
    // let mut pos: usize = 0;
    let mut escape_seq: String = String::new();
    print_prompt();
    loop {
        let c = getchar();
        match c {
            LF | CR => {
                println!("");
                TIMER.lock().start();
                if !line.is_empty() {
                    {
                        HISTORY.lock().add(line.as_str());
                    }
                    parse(line.as_str());
                    line.clear();
                }
                print_prompt();
            }
            BS | DL => {
                if !line.is_empty() {
                    print!("{} {}", BS as char, BS as char);
                    line.pop();
                }
            }
            TAB => {
                // do nothing
            }
            _ => {
                if c == ESC || !escape_seq.is_empty() {
                    escape_seq.push(c as char);
                    match escape_seq.as_str() {
                        UP_ARROW => {
                            // if !line.is_empty() {HISTORY.lock().add(line.as_str());}
                            let cmd = HISTORY.lock().up();
                            clear_screen_line(&line);
                            line = cmd.unwrap_or("".to_string());
                            print!("{}", line);
                            escape_seq.clear();
                        }
                        DOWN_ARROW => {
                            // if !line.is_empty() {HISTORY.lock().add(line.as_str());}
                            let cmd = HISTORY.lock().down();
                            clear_screen_line(&line);
                            line = cmd.unwrap_or("".to_string());
                            print!("{}", line);
                            escape_seq.clear();
                        }
                        LEFT_ARROW | RIGHT_ARROW => {
                            print!("{}", escape_seq.as_str());
                            escape_seq.clear();
                        }
                        _ => {
                            // do nothing
                        }
                    }
                } else {
                    line.push(c as char);
                    print!("{}", c as char);
                }
            }
        }
    }
}
