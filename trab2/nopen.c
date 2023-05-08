#include <errno.h>
#include <stdio.h>
#include <sys/stat.h>
#include <unistd.h>

int isopen(int fd) {
  struct stat st;
  return fstat(fd, &st) != -1 || errno != EBADF;
}

int main(void) {
  int nopen, fd;

  for (nopen = fd = 0; fd < getdtablesize(); fd++)
    if (isopen(fd))
      nopen++;

  printf("Existem %d descritores abertos\n", nopen);

  return 0;
}