#include <unistd.h>
#include <fcntl.h> 
#include <stdio.h>
#include <sys/wait.h>

int main(int argc, char* argv[])
{
	int p[2];
	char line[] = "linha\n";
	char buff[20];
	int res;
	int status;

	pipe(p);
	pid_t pid = fork();

	if(pid == 0)
	{
		//filho fecha o descritor de escrita
		close(p[1]);
		//le a linha e escreve no buffer
		res = read(p[0], buff, 20);
		write(1, buff, res);
		//filho fecha o descritor de leitura
		close(p[0]);
	}
	else
	{
		sleep(5);
		//pai fecha o descritor de leitura
		close(p[0]);
		//pai escreve o que o filho leu
		write(p[1], buff, res);
		//pai fecha o descritor de escrita
		close(p[1]);
		pid = wait(&status);
	}


	return 0;
}