%{
#include <stdio.h>
#include <string.h>
extern int yylex();
extern int yylineno;
extern char *yytext;
int yyerror();
%}

%union{
    int ivalue;
    char cvalue;
}

%token ERRO HALT PRINT READ SHOW num id
%type <ivalue> num
%type <cvalue> id
%%

Calc
    : ListaComandos
    ;

ListaComandos
    : ListaComandos Comando
    | Comando { printf("Reconheci um comando! \n"); }
    ;  

Comando
    : Print 
	| Read 
	| Show 
	| Halt 
    | Atrib
	;

Print
    : PRINT Exp
    ;

Read
    : READ id
    ;

Show 
    : SHOW
    ;

Halt
    : HALT
    ;

Atrib 
    : id '=' Exp
    ;