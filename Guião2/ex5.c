#include <unistd.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{ 
	int i;
	int status; 
    pid_t pid = 0; 
    for(i = 1; i < 11;){
        if(!pid){
            printf("Processo numero: %d pid: %d, ppid: %d \n",i, getpid(), getppid());
            i++;
            pid = fork(); 
        }else
            break;
    }
    wait(&status);
    _exit(status);
}

