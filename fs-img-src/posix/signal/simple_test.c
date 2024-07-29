#include <stdio.h>
#include <stdlib.h>
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

    // Register the signal handler using sigaction
    if (sigaction(SIGUSR1, &sa, NULL) == -1) {
        perror("sigaction");
        exit(1);
    }

    // Block SIGUSR1 signal using sigprocmask
    sigset_t mask;
    sigemptyset(&mask);
    sigaddset(&mask, SIGUSR1);
    if (sigprocmask(SIG_BLOCK, &mask, NULL) == -1) {
        perror("sigprocmask");
        exit(1);
    }

    printf("Signal handler registered. Sending signal...\n");
    // Send SIGUSR1 signal to the process
    kill(getpid(), SIGUSR1);

    printf("Signal sent. Unblocking signal...\n");
    // Unblock SIGUSR1 signal using sigprocmask
    if (sigprocmask(SIG_UNBLOCK, &mask, NULL) == -1) {
        perror("sigprocmask");
        exit(1);
    }

    printf("Signal unblocked. Restoring signal context...\n");

    // This code will not be reached
    printf("Program completed.\n");
    return 0;
}