#include <unistd.h>
#include <fcntl.h> 
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
	pid_t pid;
	int status;
	if ((pid = fork()) == 0)
	{
		execl("/bin/ls", "/bin/ls", "-l", NULL);
		printf("NOT WORKING");
		perror("exec:"); //in case of error
		_exit(0);
	}
	pid = wait(&status);
	status = WEXITSTATUS(status);
	//fazer um wait para o pai pq pode acabar primeiro
	return 0;
}