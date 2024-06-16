#include <stdio.h>
#include <stdlib.h>
#include <signal.h>

void signal_handler(int signal_number) {
    printf("Received signal: %d\n", signal_number);
    if (signal_number == SIGTSTP) {
        printf("Ctrl+Z pressed. Pausing...\n");
        // 执行需要在Ctrl+Z时暂停的操作
    }
}

int main() {
    struct sigaction sa;
    sa.sa_handler = signal_handler;
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = 0;
    struct sigaction old_sa;
    struct sigaction new_sa;
    new_sa.sa_handler = 0;
    

    // 注册信号处理程序
    sigaction(SIGTSTP, &sa, &old_sa);  // 捕获Ctrl+Z信号

    // sigaction(SIGTSTP, &new_sa, NULL);  // 恢复默认信号处理程序（Ctrl+Z信号)

    printf("Running... Press Ctrl+Z to pause.\n");
    printf("old_sa.sa_handler: %p\n", old_sa.sa_handler);
    printf("old_sa.sa_flags: %d\n", old_sa.sa_flags);
    printf("old_sa.sa_mask: %d\n", old_sa.sa_mask);
    printf("old_sa.sa_restorer: %p\n", old_sa.sa_restorer);


    while (1) {
        // 无限循环
    }

    return 0;
}