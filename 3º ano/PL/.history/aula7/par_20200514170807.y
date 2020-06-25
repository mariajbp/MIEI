
%{
    #include <stdio.h>
    #include <string.h>
    extern int yylex();
    int yyerror(char *s);
%}

%token ERRO

%%

Par: '(' Par ')' Par
   |
   ;

%%




int main()
{
    yyparse();
    printf("Comprimento da Lista : %d\n",elems);
}

int yyerror(char *s)
{
    printf("Erro sintático: %s\n", s);
    return 0;
}