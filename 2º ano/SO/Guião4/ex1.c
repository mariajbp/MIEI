#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>

int main(int argc, char* argv[])
{
	int res;
	char buf[1024];
    int n;

	//criação dos descritores
	int fdin = open("/etc/passwd", O_RDONLY);
	int fdout = open("saida.txt", O_CREAT | O_TRUNC | O_WRONLY);
	int fderror = open("erros.txt", O_CREAT | O_TRUNC | O_WRONLY);

	//duplicação - apontar para os descritores pretendidos
	res = dup2(fdin, 0);
	res = dup2(fdout, 1);
	res = dup2(fderror, 2);

	//fechar os descritores abertos inicialmente
	close(fdin);
	close(fdout);
	close(fderror);

	while ((n = read(0, buf, 1024)) > 0) 
    {
        write(1, buf, 1024);
        write(2, buf, 1024);
    }
}
