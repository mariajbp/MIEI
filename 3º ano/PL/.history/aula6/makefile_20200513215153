
lisp.exe : y.tab.o lex.yy.o
	gcc -o lisp.exe y.tab.o lex.yy.o -ll

y.tab.o : y.tab.c
	gcc -c y.tab.c

lex.yy.o : lex.yy.c 
	gcc -c lex.yy.c

y.tab.c y.tab.h : lisp.y
	yacc -d lisp.y

lex.yy.c : lisp.l y.tab.h
	flex lisp.l