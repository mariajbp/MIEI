#include <unistd.h>
#include <fcntl.h> 
#include <stdio.h>
#include <stdlib.h>

#define TENMB 1024 * 1024

void populateBuffer(char *buffer, int nbyte) {
    for(int i = 0; i < nbyte; i++)
        buffer[i] = 'a';
}

int main(int argc, char **argv) {
    char buffer[1024];
    int fp = open(argv[1], O_CREAT | O_TRUNC | O_WRONLY, 0777);
    populateBuffer(buffer, 1024);
    for(int i = 0; i < TENMB; i++)
        write(fp, buffer, 1024);
}

