#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>

int main(int argc, char* argv[])
{
	//criação dos descritores
	int fdin = open("/etc/passwd", O_RDONLY);
	int fdout = open("saida.txt", O_CREAT | O_TRUNC | O_WRONLY);
	int fderror = open("erros.txt", O_CREAT | O_TRUNC | O_WRONLY);

	//duplicação - apontar para os descritores pretendidos
	dup2(fdin, 0);
	dup2(fdout, 1);
	dup2(fderror, 2);

	//fechar os descritores abertos inicialmente
	close(fdin);
	close(fdout);
	close(fderror);

	pid_t pid = fork();
	if(pid == 0)
		execlp("wc", "wc", NULL);

}


//vai dar mesmo resultado que um cat 
