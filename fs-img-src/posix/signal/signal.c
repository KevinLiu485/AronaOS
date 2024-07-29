#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>

void signal_handler(int signal_number) {
    printf("Received signal: %d\n", signal_number);
}

int main() {
    // 注册信号处理程序
    signal(SIGTSTP, signal_handler);  // 捕获Ctrl+C信号

    printf("Running... Press Ctrl+Z to pause.\n");

    while (1) {
        // 无限循环
        sleep(1);
    }

    return 0;
}