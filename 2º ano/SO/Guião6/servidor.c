#include <sys/types.h>
#include <sys/stat.h>

int main(int argc, char* argv[])
{
	pid_t pid;
	int nbytes;
	char buf[1024];
	mkfifo("fifo", 0666);

	pid = fork();
	if(pid == 0)
	{
		int fdf = open("fifo", O_RDONLY);

		int fdl = open("logs", O_CREATE, O_WRONLY, 0666);

		while(nbytes = read("fifo", buff, 1024) > 0)
		{
			write(log, buf, nbytes);
		}
		wait(NULL);
	}
	return 0;
}