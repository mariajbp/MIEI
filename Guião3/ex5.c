#include <unistd.h>
#include <fcntl.h> 
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
	pid_t pid = fork();
	int i;

	for(i=1; i<argc; i++)	
	{
		if(pid == 0)
		{
			execlp(argv[i], argv[i], NULL);
			_exit(-1); //in case of error
		}
	}

	for (i=1; i<argc; i++) 
	{
		wait(NULL);
	}
}