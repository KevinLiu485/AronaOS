#![no_std]
#![no_main]
#![allow(clippy::println_empty_string)]

extern crate alloc;

#[macro_use]
extern crate user_lib;
extern crate spin;

const LF: u8 = 0x0au8;
const CR: u8 = 0x0du8;
const DL: u8 = 0x7fu8;
const BS: u8 = 0x08u8;

const UP_ARROW: &str = "\x1B[A";
const DOWN_ARROW: &str = "\x1B[B";
const ESC: u8 = 0x1bu8;
const TAB: u8 = 0x09u8;

// Arona OS theme color
const THEME_COLOR: &str = "\u{1B}[38;5;14m";
const RESET_COLOR: &str = "\u{1B}[0m";

use alloc::{
    borrow::ToOwned,
    string::{String, ToString},
    vec::Vec,
};
use spin::{Lazy, Mutex};
use user_lib::{
    chdir,
    console::getchar,
    defs::{TimeVal, WaitOption},
    execve, exit, fork, getcwd, gettime, waitpid,
};

struct Timer {
    start: TimeVal,
}

impl Timer {
    fn new() -> Self {
        Timer {
            start: TimeVal { sec: 0, usec: 0 },
        }
    }

    fn start(&mut self) {
        self.start = gettime().unwrap();
    }

    fn timeval_to_ms(tv: TimeVal) -> u64 {
        tv.sec as u64 * 1000 + tv.usec as u64 / 1000
    }

    /// return elapsed time in ms, then end the timer
    fn elapsed_ms(&self) -> u64 {
        let now = gettime().unwrap();
        let start_ms = Self::timeval_to_ms(self.start);
        let now_ms = Self::timeval_to_ms(now);
        now_ms - start_ms
    }
}

static TIMER: Lazy<Mutex<Timer>> = Lazy::new(|| Mutex::new(Timer::new()));

struct History {
    commands: Vec<String>,
    index: usize,
}

impl History {
    fn new() -> Self {
        History {
            commands: Vec::new(),
            index: 0,
        }
    }

    fn add(&mut self, cmd: &str) {
        if cmd != self.commands.last().unwrap_or(&"".to_string()) {
            self.commands.push(cmd.to_owned());
            self.index = self.commands.len();
        }
    }

    fn up(&mut self) -> Option<String> {
        if self.index == 0 {
            return self.commands.first().cloned();
        }
        self.index -= 1;
        Some(self.commands[self.index].clone())
    }

    fn down(&mut self) -> Option<String> {
        self.index += 1;
        if self.index >= self.commands.len() {
            self.index = self.commands.len();
            return None;
        }
        Some(self.commands[self.index].clone())
    }

    fn print(&self) {
        println!("[Arona] Arona's memory with sensei:");
        for (i, cmd) in self.commands.iter().enumerate() {
            println!("{}: {}", i, cmd);
        }
    }

    #[allow(unused)]
    fn at_now(&self) -> bool {
        self.index == self.commands.len()
    }
}

static HISTORY: Lazy<Mutex<History>> = Lazy::new(|| Mutex::new(History::new()));

struct Command {
    tokens: Vec<String>,
}

impl From<&str> for Command {
    fn from(line: &str) -> Self {
        let tokens: Vec<String> = line.split(' ').map(|s| s.to_string()).collect();
        Command { tokens }
    }
}

impl Command {
    fn get_name(&self) -> &str {
        self.tokens[0].as_str()
    }

    /// excluding the command name
    fn get_args(&self) -> Vec<&str> {
        if self.tokens.len() < 2 {
            return Vec::new();
        }
        self.tokens[1..].iter().map(|s| s.as_str()).collect()
    }

    /// including the command name
    fn get_argv(&self) -> Vec<&str> {
        self.tokens.iter().map(|s| s.as_str()).collect()
    }

    fn exec(&self) {
        execve(self.get_name(), &self.get_argv(), &[])
            .expect("[Arona] Wuuum...Sensei, I don't know this command. Could you teach me?");
    }
}

fn inner_cmd(cmd: &Command) -> bool {
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
        _ => false,
    }
}

fn parse(line: &str) {
    let cmd = Command::from(line);
    if inner_cmd(&cmd) {
        return;
    }
    let pid = fork().expect("[Arona] Wuuum...Sensei, fork seems not working?");
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
                    let cmd = match escape_seq.as_str() {
                        UP_ARROW => HISTORY.lock().up(),
                        DOWN_ARROW => HISTORY.lock().down(),
                        _ => continue,
                    };
                    clear_screen_line(&line);
                    line = cmd.unwrap_or("".to_string());
                    print!("{}", line.as_str());
                    escape_seq.clear();
                } else {
                    line.push(c as char);
                    print!("{}", c as char);
                }
            }
        }
    }
}
