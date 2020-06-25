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
    ;

SExpLst: SExp SExpLst
       ;
       
SExp: pal 
    | num
    | '(' SExpLst ')'   {elems++;}
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


