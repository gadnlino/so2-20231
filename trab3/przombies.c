#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>

void finish(){
    //TODO: terminate gracefully
    exit(0);
}

void do_nothing(){}

int main(int argc, char **argv){

    signal(SIGINT, do_nothing);
    signal(SIGTERM, finish);

    while(1){
        printf("I am about to sleep...\n");
        sleep(1);
    }

    return 0;
}