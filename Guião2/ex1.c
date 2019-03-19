#include <unistd.h>
#include <fcntl.h> 
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
	pid_t processIDson = getpid();       //retorna ID do processo atual
	pid_t processIDfather = getppid();  //retorna o ID do pai

	printf("ID do processo atual: %d\n", processIDson);
	printf("ID do processo pai: %d\n", processIDfather);

	//sleep(5)

	return 0;
}
