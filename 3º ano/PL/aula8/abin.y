%{
    #include <stdio.h>
    #include <string.h>
    extern int yylex();
    int yyerror(char *s);
%}


%union
{
    int vint;
}


%token ERRO inteiro
%type <vint> inteiro

%%
SeqAbin: Abin 
       | SeqAbin Abin 
       ;

Abin: '(' ')'                       {printf("Vazia");}
    | '(' inteiro Abin Abin ')'     {printf("Nodo \n");}
    ;
%%



int main()
{
    yyparse();
    return 0;
}

int yyerror(char *s)
{
    printf("Erro sintático: %s\n", s);
    return 0;
}
