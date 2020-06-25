%{
    #include <stdio.h>
    #include <string.h>
    extern int yylex();
    int yyerror(char *s);
%}


%union
{
    char* svalue;
}


%token ERRO 
%type 


%%
Turma: DECL 

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

// DECL = declaração inicial do ficheiro xml
