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

Alunos: Alunos Aluno
      | Aluno
      ;

Aluno: AALUNO IdAluno Nome Notas FAluno 
     ;

IdAluno: AID string FID
       ;

Nome: ANOME string FNOME
    ;

Notas: Nota
     | Nota Notas
     ;

Nota: ANOTA Uc Valor FNOTA
    ;

Uc: AUC string FUC
  ;

Valor: AVALOR num FVALOR
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
