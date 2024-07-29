#include <stdio.h>
#include <signal.h>

int main() {
    sigset_t set, oldset;
    printf("sigset_t size: %lu\n", sizeof(sigset_t));
    
    // 阻塞 SIGINT 信号
    sigemptyset(&set);
    sigaddset(&set, SIGINT);
    sigprocmask(SIG_BLOCK, &set, &oldset);
    
    printf("SIGINT signal blocked. Press Ctrl+C to send the signal.\n");
    
    // 等待 SIGINT 信号
    getchar();
    
    // 解除阻塞 SIGINT 信号
    sigprocmask(SIG_UNBLOCK, &set, NULL);
    
    printf("SIGINT signal unblocked.\n");
    
    return 0;
}