coord.exe : y.tab.o lex.yy.o
	gcc -o coord.exe y.tab.o lex.yy.o -ll

y.tab.o : y.tab.c
	gcc -c y.tab.c

lex.yy.o : lex.yy.c 
	gcc -c lex.yy.c

y.tab.c y.tab.h : coord.y
	yacc -d coord.y

lex.yy.c : coord.l y.tab.h
	flex coord.l