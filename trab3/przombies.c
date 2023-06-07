#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>
#include <string.h>

const char *ARQUIVO_LOG = "./saida.log";

void finish()
{
    // TODO: terminate gracefully
    exit(0);
}

void do_nothing() {}

void escreve_delimitador()
{
    FILE *file;

    file = fopen(ARQUIVO_LOG, "r");
    if (file == NULL)
    {
        printf("File does not exist. Creating and writing to the file.\n");
        file = fopen(ARQUIVO_LOG, "w");

        fprintf(file, "       PID       PPID Nome do Programa\n");
        fprintf(file, "=========================================\n");
        fclose(file);
    }
    else
    {
        fclose(file);
        file = fopen(ARQUIVO_LOG, "a");
        fprintf(file, "=========================================\n");
        fclose(file);
    }
}

void write_zombie_processes()
{
    char command[100] = "ps -e -o s,pid:10,ppid:10,comm | grep '^Z' | cut -d' ' -f2- | rev | cut -d' ' -f2- | rev >> ";
    strcat(command, ARQUIVO_LOG);
    system(command);
}

int main(int argc, char **argv)
{
    if (argc < 2) {
        printf("Favor passar o parametro n\n");
        exit(1);
    }

    int n = atoi(argv[1]);

    if(n < 1){
        printf("n deve ser maior ou igual a 1\n");
        exit(1);
    }
    
    if (fork())
    {
        exit(0);
    }

    int i;

    for (i = 1; i <= 31; i++)
    {
        signal(i, do_nothing);
    }

    signal(SIGINT, do_nothing);
    signal(SIGTERM, finish);    

    while (1)
    {
        escreve_delimitador();
        write_zombie_processes();
        sleep((unsigned int)n);
    }

    return 0;
}
