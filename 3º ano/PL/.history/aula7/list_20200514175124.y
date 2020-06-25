%{
    #include <stdio.h>
    #include <string.h>
    extern int yylex();
    int yyerror(char *s);
%}

%token ERRO INT DOISPONTOS

%%
SeqListas: Lista SeqListas
         | 
         ;

Lista:'['']'
     |'['Elems']'
     ;

Elems: Elem
     | Elem ',' Elems
     ;

Elem: INT
    | Intervalo
    ;

Intervalo: INT DOISPONTOS INT
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