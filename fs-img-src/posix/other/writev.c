#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <stdio.h>
#include <sys/syscall.h>

int main() {
    ssize_t bytes_written;
    int fd;
    char *buf0 = "short string\n";
    char *buf1 = "This is a longer string\n";
    char *buf2 = "This is the longest string in this example\n";
    int iovcnt;
    struct iovec iov[3];

    iov[0].iov_base = buf0;
    iov[0].iov_len = strlen(buf0);
    iov[1].iov_base = buf1;
    iov[1].iov_len = strlen(buf1);
    iov[2].iov_base = buf2;
    iov[2].iov_len = strlen(buf2);

    fd = open("output.txt", O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (fd == -1) {
        perror("open");
        return 1;
    }

    iovcnt = sizeof(iov) / sizeof(struct iovec);

    bytes_written = writev(fd, iov, iovcnt);
    if (bytes_written == -1) {
        perror("writev");
        close(fd);
        return 1;
    }

    printf("Bytes written: %zd\n", bytes_written);

    close(fd);
    return 0;
}