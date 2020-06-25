%{
    #include <stdio.h>
    #include <string.h>
    extern int yylex();
    int yyerror(char *s);

    int elems = 0;
%}

%token pal num

%%

Lisp: SExp

SExp: pal 
    | num
    | '(' SExpLst ')'   {elems++;}

SExpLst: SExp SExpLst
       ;

%%

int main()
{
    int prox;
    while(prox == yylex())
        printf("%d", prox);
    putchar("\n");
}

int yyerror(char *s)
{
    printf("Erro sintático: %s\n", s);
    return 0;
}


