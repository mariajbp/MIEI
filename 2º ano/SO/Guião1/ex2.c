#include <unistd.h>
#include <fcntl.h> 
#include <stdio.h>

int main(int argc, char *argv[])
{
	char buff;
	while(read(0, &buff, 1))
	{
		write(1, &buff, 1);
	}
}