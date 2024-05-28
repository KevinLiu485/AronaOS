use crate::config::SyscallRet;
use crate::fs::{open_file, OpenFlags};
use crate::mm::{translated_refmut, translated_str};
use crate::task::schedule::spawn_thread;
use crate::task::{current_task, current_user_token, exit_current, yield_task};
use crate::timer::get_time_ms;
use alloc::sync::Arc;

pub fn sys_exit(exit_code: i32) -> SyscallRet {
    exit_current(exit_code);
    Ok(0)
}

pub async fn sys_yield() -> SyscallRet {
    yield_task().await;
    Ok(0)
}

pub fn sys_get_time() -> SyscallRet {
    Ok(get_time_ms())
}

pub fn sys_getpid() -> SyscallRet {
    Ok(current_task().unwrap().pid.0)
}

pub fn sys_fork() -> SyscallRet {
    let current_task = current_task().unwrap();
    let new_task = current_task.fork();
    let new_pid = new_task.pid.0;
    // modify trap context of new_task, because it returns immediately after switching
    let trap_cx = new_task.inner_lock().get_trap_cx();
    // we do not have to move to next instruction since we have done it before
    // for child process, fork returns 0
    trap_cx.x[10] = 0;
    // add new task to scheduler
    spawn_thread(new_task);
    Ok(new_pid)
}

pub async fn sys_exec(path: usize) -> SyscallRet {
    let token = current_user_token();
    let path = translated_str(token, path as *const u8);
    if let Ok(app_inode) = open_file(path.as_str(), OpenFlags::RDONLY) {
        let all_data = app_inode.read_all().await;
        let task = current_task().unwrap();
        task.exec(all_data.as_slice());
        Ok(0)
    } else {
        Err(1)
    }
}

/// If there is not a child process whose pid is same as given, return -1.
/// Else if there is a child process but it is still running, return -2.
pub fn sys_waitpid(pid: isize, exit_code_ptr: *mut i32) -> SyscallRet {
    let task = current_task().unwrap();
    // find a child process

    // ---- access current PCB exclusively
    let mut inner = task.inner_lock();
    if !inner
        .children
        .iter()
        .any(|p| pid == -1 || pid as usize == p.getpid())
    {
        return Err(1);
        // ---- release current PCB
    }
    let pair = inner.children.iter().enumerate().find(|(_, p)| {
        // ++++ temporarily access child PCB exclusively
        p.inner_lock().is_zombie() && (pid == -1 || pid as usize == p.getpid())
        // ++++ release child PCB
    });
    if let Some((idx, _)) = pair {
        let child = inner.children.remove(idx);
        // confirm that child will be deallocated after being removed from children list
        assert_eq!(Arc::strong_count(&child), 1);
        let found_pid = child.getpid();
        // ++++ temporarily access child PCB exclusively
        let exit_code = child.inner_lock().exit_code;
        // ++++ release child PCB
        *translated_refmut(inner.memory_set.token(), exit_code_ptr) = exit_code;
        Ok(found_pid)
    } else {
        Err(2)
    }
    // ---- release current PCB automatically
}
