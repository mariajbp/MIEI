%{
    #include <stdio.h>
    #include <string.h>
    extern int yylex();
    int yyerror(char *s);
%}

%token pal num

%%

Lisp: SExp

SExp: pal 
    | num
    | '(' SExpLst ')'

SExpLst: SExp SExpLst
       ;

%%

int main(){
    yyparse();
    return 0;
}

int erroSem(char *s){
    printf("Erro Semântico na linha: %d, %s...\n", yylineno, s);
    return 0;
}

int yyerror(){
    printf("Erro Sintático ou Léxico na linha: %d, com o texto: %s\n", yylineno, yytext);
    return 0;
}

