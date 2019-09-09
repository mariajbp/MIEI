#include <sys/types.h>
#include <sys/stat.h>

int main(int argc, char* argv[])
{
    int nbytes;
    char buf[10];

    int fd = open("fifo", O_RDONLY);

   
    while ((nbytes = read(0, buf, 10)) > 0)
        write(1, buf, nbytes);
    close(fd);
    return 0;
}
