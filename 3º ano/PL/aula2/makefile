ips.exe : lex.yy.c
	gcc -o ips.exe lex.yy.o -ll

lex.yy.o : lex.yy.c
	gcc -c lex.yy.c

lex.yy.c : username.l
	flex username.l
