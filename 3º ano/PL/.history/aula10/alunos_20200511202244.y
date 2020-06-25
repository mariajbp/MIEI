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


%token ERRO string DECL AALUNOS FALUNOS AALUNO FAluno AID FID ANOME FNOME ANOTAS FNOTAS ANOTA FNOTA AUC FUC AVALOR FVALOR
%type 


%%
Turma : DECL AALUNOS Alunos FALUNOS
      ;

Alunos: Alunos Aluno
      | Aluno
      ;

Aluno: AALUNO IdAluno Nome ANOTAS Notas FNOTAS FAluno 
     ;

IdAluno: AID string FID
       ;

Nome: ANOME string FNOME
    ;

Notas: Nota Notas
     |
     ;

Nota: ANOTA Uc Valor FNOTA
    ;

Uc: AUC string FUC
  ;

Valor: AVALOR string FVALOR
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
