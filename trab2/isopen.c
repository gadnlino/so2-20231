#include <errno.h>
#include <stdio.h>
#include <sys/stat.h>
#include <unistd.h>

int isopen(int fd) {
  struct stat st;
  return fstat(fd, &st) != -1 || errno != EBADF;
}