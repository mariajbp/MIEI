#include <unistd.h>
#include <fcntl.h> 
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
	execl("/bin/ls", "/bin/ls", "-l", NULL);
    printf("NOT WORKING");
	
	perror("exec"); //in case of error
	
}
