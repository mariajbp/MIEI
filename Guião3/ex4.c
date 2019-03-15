#include <unistd.h>
#include <fcntl.h> 
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
	execv("./ex3", argv);
	perror("exec"); //in case of error
}