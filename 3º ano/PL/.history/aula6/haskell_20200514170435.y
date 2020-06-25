%{
    #include <stdio.h>
    #include <string.h>
    extern int yylex();
    int yyerror(char *s);
%}

%token num DOISPONTOS

%%
Lista:'['']'
     |'['Elems']'
     ;

Elems: Elem
     | Elem Sep Elems
     ;

Elem: num
    | Intervalo
    ;

Intervalo: num Sep num
         ;

Sep: ','
   | DOISPONTOS

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