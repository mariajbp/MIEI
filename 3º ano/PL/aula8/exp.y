%{
    #include <stdio.h>
    #include <string.h>
    extern int yylex();
    int yyerror(char *s);
%}


%union
{
    int vint;
    char* op;
}


%token ERRO inteiro
%type <vint> inteiro Termo Exp 
%type <op> Op

%%

SeqExp: SeqExp Exp 
      | Exp 
      ;

Exp: Exp Op Termo 
   | Termo             {$$ = $1;}
   ;

Termo: inteiro         {$$ = $1;}
     ;
 
Op: '+'                 {$$ ='+';}
  | '-'                 {$$ ='-';}
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
