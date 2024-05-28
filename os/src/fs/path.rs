use core::fmt::Display;

use alloc::{
    string::{String, ToString},
    vec::Vec,
};

#[derive(Debug, Clone)]
pub struct Path {
    inner: Vec<String>,
}

impl From<&str> for Path {
    fn from(v: &str) -> Self {
        Self {
            inner: v
                .split("/")
                .filter(|s| s.len() > 0)
                .map(|s| s.to_string())
                .collect(),
        }
    }
}

impl From<String> for Path {
    fn from(v: String) -> Self {
        Self::from(v.as_str())
    }
}

impl Display for Path {
    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
        write!(f, "{}", "/".to_string() + &self.inner.join("/"))
    }
}

impl Path {
    fn push(&mut self, s: &str) {
        self.inner.push(s.to_string());
    }

    #[allow(unused)]
    fn pop(&mut self) -> String {
        self.inner.pop().unwrap_or(String::new())
    }

    pub fn new() -> Self {
        Self { inner: Vec::new() }
    }

    pub fn get_name(&self) -> String {
        self.inner.last().unwrap_or(&String::new()).to_string()
    }

    pub fn clone_and_append(&self, s: &str) -> Self {
        let mut ret = self.clone();
        ret.push(s);
        ret
    }
}
