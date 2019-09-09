#include <unistd.h>
#include <sys/wait.h>
#include <stdio.h>

int main(int argc, char* argv[])
{
	pid_t pid;
	int status = 0;
	if ((pid = fork()) == 0)
	{
		//sleep(2)
		printf("pid do filho: %d\n", getpid());
		printf("pid do pai: %d\n", getppid() );
		_exit(0);
	}
	else 
	{
		sleep(10);
		printf("pid do pai: %d\n", getpid());
		printf("pid do avô: %d\n", getppid()); 
		//wait(&status);
	}
	return 0;
	
}

//Sem wait o pid do pai do filho vai ser 1 (caso acabe primeiro)

//Forçar o pai a terminar em ultimo, fazer um sleep


