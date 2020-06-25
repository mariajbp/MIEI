%{
    #include <stdio.h>
    extern int yylex();
    int yyerror();
%}

%union{
    float vreal;
}


//tokens retorados na analise léxica
%token ERROR num

//associado a um token variavel, neste caso ao token num
%type <vreal> num


%%

Lista : Coord Lista
      | Coord

Coord : '(' num ',' num ')'
      ;


%%

int main()
{
    yyparse();
    return 0;
}

int yyerror()
{
    printf("Erro sintático \n");
    return 0;
}