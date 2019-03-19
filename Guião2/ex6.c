#include <unistd.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>



int main(int argc, char* argv[])
{
	if (argc <2) 
		exit(-1);

	int target = argc(1);
	int status;
	int nlines = 5;
	int ncolumns = 1000;

	//matrix generator with random numbers
	int range = ncolumns * 5;
	int matriz[nlines][ncolumns];
	for (int i= 0; i<ncolumns; i++)
	{
		for(int j = 0; j<nlines; j++)
		{
			matriz[nlines][ncolumns] = rand() % range;
		}
	}
	printf("matrix has been filled \n");



	//fork para cada numero de linhas printa o que vai fazer e procura o que fazer
	//exit -1 se não der senão _exit (i)

	


}



//Dividir processos para correrem todos ao mesmo tempo
//Vão concorrer por CPU e eventualmente vai deixar de ser tão eficiente
//Depende do escalonamento
//Fazer novos processos ocupa muitos recursos