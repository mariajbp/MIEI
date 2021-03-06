#include <unistd.h>
#include <sys/wait.h>
#include <stdio.h>


int main(int argc, char* argv[])
{
	pid_t pid;
	int i;
	int status;
	for(i=1; i<11; i++)
	{
		pid = fork();
		if (pid == 0)
		{
			printf("pid do filho: %d\n", getpid());
			printf("pid do pai: %d\n", getppid());
			_exit(i);
		}
	}

	pid = wait(&status);
	status = WEXITSTATUS(status);
	printf("O filho %d terminou com o codigo %d  \n", pid, status );
	
	return 0;
}

// o pai cria os n processos e espera por todos no fim --> concorrentemente