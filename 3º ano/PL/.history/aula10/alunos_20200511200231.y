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
Turma : DECL AALUNOS Alunos FALUNOS
      ;

Alunos: aluno
      | aluno Alunos 
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

// DECL = declaração inicial do ficheiro xml -> <?xml version="1.0"?>
//AALUNOS = <alunos> e  FALUNOS = </alunos>
