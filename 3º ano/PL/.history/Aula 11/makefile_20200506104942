calc.exe : y.tab.o lex.yy.o lerInt.o
	gcc -o calc.exe y.tab.o lex.yy.o lerInt.o -ll

y.tab.o : y.tab.c
	gcc -c y.tab.c

lex.yy.o : lex.yy.c
	gcc -c lex.yy.c

y.tab.c y.tab.h : calc.y lerInt.h
	yacc -d calc.y 

lex.yy.c : calc.l y.tab.h
	flex calc.l 

lerInt.o : lerInt.c lerInt.h
	gcc -c lerInt.c 
