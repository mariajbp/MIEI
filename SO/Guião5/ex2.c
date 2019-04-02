#include <unistd.h>
#include <fcntl.h> 
#include <string.h>

int main(int argc, char* argv[])
{
	
	int p[2];
	char buff[20];
	int res;

	pipe(p);
	pid_t pid = fork();   


	if(pid == 0)
	{
		//fecha o descritor de escrita
		close(p[1]);
		while ((res = read(p[0], buff, 20)) > 0)
		{
			write(1, buff, res);
		}
		//fecha o descritor de leitura
		close(p[0]);

	}
	else
	{
		//fecha o descritor de leitura
		close(p[0]);
		sleep(2);
		write(p[1], "it's\n", strlen("it's\n"));
		sleep(2);
		write(p[1], "britney bitch\n", strlen("britney bitch\n"));
		//fecha o descritor de escrita
		close(p[1]);
	}

	return 0;
}
