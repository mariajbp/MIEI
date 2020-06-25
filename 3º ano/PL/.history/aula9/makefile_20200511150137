json.exe : y.tab.o lex.yy.o
	gcc -o json.exe y.tab.o lex.yy.o -ll

y.tab.o : y.tab.c
	gcc -c y.tab.c

lex.yy.o : lex.yy.c 
	gcc -c lex.yy.c

y.tab.c y.tab.h : json.y
	yacc -d json.y

lex.yy.c : json.l y.tab.h
	flex json.l