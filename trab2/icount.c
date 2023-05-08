#include <complex.h>
#include <dirent.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <errno.h>
#include <inttypes.h>

char flag = 'r';
int counter = 0;
int file_counter = 0;
int inodes_counter = 0;
ino_t* lista_inodes;

int walk_dir(const char *path, void (*func)(const char *)) {
  DIR *dirp;
  struct dirent *dp;
  char *p, *full_path;
  int len;

  /* abre o diretório */
  if ((dirp = opendir(path)) == NULL)
    return (-1);

  len = strlen(path);

  /* aloca uma área na qual, garantidamente, o caminho caberá */
  if ((full_path = malloc(len + NAME_MAX + 2)) == NULL) {
    closedir(dirp);
    return (-1);
  }

  /* copia o prefixo e acrescenta a ‘/’ ao final */
  memcpy(full_path, path, len);
  p = full_path + len;
  *p++ = '/'; /* deixa “p” no lugar certo! */

  while ((dp = readdir(dirp)) != NULL) {
    /* ignora as entradas “.” e “..” */
    if (strcmp(dp->d_name, ".") == 0 || strcmp(dp->d_name, "..") == 0)
      continue;

    strcpy(p, dp->d_name);

    /* “full_path” armazena o caminho */
    (*func)(full_path);
  }

  free(full_path);
  closedir(dirp);
  return (0);
} /* end walk_dir */

void count_files(const char *path) {
  file_counter++;
}

void check_st_mode(const char *path) {
  struct stat path_stat;
  if (lstat(path, &path_stat) != 0) {
    printf("Arquivo nao existe: %s", path);
    exit(errno);
  }

  for (int i = 0; i < inodes_counter; i++) {
    if (lista_inodes[i] == path_stat.st_ino) {
      return;
    }
  }
  if (inodes_counter >= file_counter) {
    printf("tem mais inode que arquivo wtf");
    exit(1);
  }
  lista_inodes[inodes_counter++] = path_stat.st_ino;

  switch (flag) {
    case 'r':
      if (S_ISREG(path_stat.st_mode)) counter++;
      break;
    case 'd':
      if (S_ISDIR(path_stat.st_mode)) counter++;
      break;
    case 'l':
      if (S_ISLNK(path_stat.st_mode)) counter++;
      break;
    case 'b':
      if (S_ISBLK(path_stat.st_mode)) counter++;
      break;
    case 'c':
      if (S_ISCHR(path_stat.st_mode)) counter++;
      break;
  }
}

int main(int argc, char **argv) {

  char c;
  while ((c = getopt (argc, argv, "bcdlr")) != -1) {
    flag = c;
  }

  if (optind + 1 != argc) {
    printf("passou parametros demais");
    return 1;
  }

  walk_dir(argv[optind], count_files);
  lista_inodes = calloc(file_counter, sizeof(ino_t));

  walk_dir(argv[optind], check_st_mode);

  printf("%d\n", counter);
  
  return 0;
}