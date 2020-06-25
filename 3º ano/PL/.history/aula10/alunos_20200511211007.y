%{
    #include <stdio.h>
    #include <string.h>
    extern int yylex();
    int yyerror(char *s);

    int nAlunos = 0;
%}


%union
{
    char* svalue;
}


%token ERRO string DECL AALUNOS FALUNOS AALUNO FALUNO AID FID ANOME FNOME ANOTAS FNOTAS ANOTA FNOTA AUC FUC AVALOR FVALOR
%type <svalue> string;


%%
Turma : DECL AALUNOS Alunos FALUNOS     { printf("Reconheci uma turma com %d alunos", nAlunos);}
      ;

Alunos: Alunos Aluno                  
      | Aluno
      ;

Aluno: AALUNO IdAluno Nome ANOTAS Notas FNOTAS FALUNO     { nAlunos ++;}       
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
