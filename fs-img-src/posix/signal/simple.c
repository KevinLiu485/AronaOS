#include <stdio.h>
#include <signal.h>
#include <unistd.h>

void signal_handler(int signum) {
    printf("Received signal: %d\n", signum);
    // Perform any necessary signal handling here
}

int main() {
    struct sigaction sa;
    sa.sa_handler = signal_handler;
    sa.sa_flags = 0;
    sigemptyset(&sa.sa_mask);

    sigaction(SIGUSR1, &sa, NULL);

    sigset_t mask;
    sigemptyset(&mask);
    sigaddset(&mask, SIGUSR1);
    sigprocmask(SIG_BLOCK, &mask, NULL);

    printf("Signal handler registered. Sending signal...\n");
    kill(getpid(), SIGUSR1);

    printf("Signal sent. Unblocking signal...\n");
    sigprocmask(SIG_UNBLOCK, &mask, NULL);

    printf("Signal unblocked. Restoring signal context...\n");

    // This code will not be reached
    printf("Program completed.\n");
    return 0;
}