#include <sys/types.h>
#include <sys/stat.h>

int main(int argc, char *argv[])
{
	int nbytes;
	char buff[10];

	int fd = open("fifo", O_WRONLY);

	while((nbytes = read(0, buf, 10)) > 0)
	{
		write(fd, buf, nbytes);
	}
	close(fd);
	return 0;
}
