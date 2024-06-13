use alloc::{borrow::ToOwned, string::{String, ToString}, vec::Vec};

pub struct History {
    commands: Vec<String>,
    index: usize,
}

impl History {
    pub fn new() -> Self {
        History {
            commands: Vec::new(),
            index: 0,
        }
    }

    pub fn add(&mut self, line: &str) {
        if line != self.commands.last().unwrap_or(&"".to_string()) {
            self.commands.push(line.to_owned());
            self.index = self.commands.len();
        }
    }

    pub fn up(&mut self) -> Option<String> {
        if self.index == 0 {
            return self.commands.first().cloned();
        }
        self.index -= 1;
        Some(self.commands[self.index].clone())
    }

    pub fn down(&mut self) -> Option<String> {
        self.index += 1;
        if self.index >= self.commands.len() {
            self.index = self.commands.len();
            return None;
        }
        Some(self.commands[self.index].clone())
    }

    pub fn print(&self) {
        println!("[Arona] Arona's memory with sensei:");
        for (i, cmd) in self.commands.iter().enumerate() {
            println!("{}: {}", i, cmd);
        }
    }

    #[allow(unused)]
    pub fn at_now(&self) -> bool {
        self.index == self.commands.len()
    }
}