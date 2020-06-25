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
    : ListaComandos Comando { printf("Reconheci um comando!\n"); }
    | Comando { printf("Reconheci um comando!\n"); }
    ;  

Comando
    : Print 
	| Read 
	| Show 
	| Halt 
    | Atrib
	;

Print
    : PRINT Exp ';'
    ;

Read
    : READ id ';'
    ;

Show 
    : SHOW ';'
    ;

Halt
    : HALT ';'
    ;

Atrib 
    : id '=' Exp ';'
    ;

Exp
    : Exp '+' Termo
    | Exp '_' Termo
    | Termo
    ;

Termo 
    : Termo '/' Fator
    | Termo '*' Fator
    | Fator
    ;

Fator 
    : id
    | num
    | '(' Exp ')'
    ;

%%
int main(){
    yyparse();
    return 0;
}

int yyerror(){
    printf("Erro Sintático ou Léxico na linha: %d, com o texto: %s\n", yylineno, yytext);
    return 0;
}
/**
coisas mais prioritarias no nivel mais baixo da arvore
**/