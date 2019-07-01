#include <sys/types.h>
#include <sys/stat.h>

int main(int argc, char* argv[])
{
	int fd = open("fifo", O_WRONLY);

	if(fd > 0)
	{
		for(int i = 1; i <= argc; i++)
		{
			write(fd, argv[i], strlen(argv[i]));
		}
		close(fd);
	}
}