use alloc::{string::{String, ToString}, vec::Vec};
use user_lib::{execve, exit};

pub struct Command {
    tokens: Vec<String>,
}

impl From<&str> for Command {
    fn from(line: &str) -> Self {
        let tokens: Vec<String> = line.split(' ').map(|s| s.to_string()).collect();
        Command { tokens }
    }
}

impl Command {
    pub fn get_name(&self) -> &str {
        self.tokens[0].as_str()
    }

    /// excluding the command name
    pub fn get_args(&self) -> Vec<&str> {
        if self.tokens.len() < 2 {
            return Vec::new();
        }
        self.tokens[1..].iter().map(|s| s.as_str()).collect()
    }

    /// including the command name
    pub fn get_argv(&self) -> Vec<&str> {
        self.tokens.iter().map(|s| s.as_str()).collect()
    }

    pub fn exec(&self) {
        execve(self.get_name(), &self.get_argv(), &[])
            .unwrap_or_else(|_| println!("[Arona] Wuuum...Sensei, I don't know this command. Could you teach me?"));
        exit(-1);
    }
}