%{
    #include <stdio.h>
    #include <string.h>
    extern int yylex();
    int yyerror(char *s);
%}


%union
{
    
}


%token ERRO READ PRINT SHOW num id
%type 


%%

Calculadora: ListaComandos
          ;

ListaComandos: Comando
             | ListaComandos Comando 
             ;

Comando: Print
       | Read
       | Show
       | Atrib
       ;

Print: PRINT Exp
     ;

Read: READ id
    ;

Show: SHOW 
    ;

Atrib: id '=' Exp
     ;

Exp:
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
