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
Turma : DECL AALUNOS Alunos FALUNOS     
      ;

Alunos: Alunos Aluno                  
      | Aluno
      ;

Aluno: AALUNO IdAluno Nome ANOTAS Notas FNOTAS FALUNO     { nAlunos ++; printf("\n");}       
     ;

IdAluno: AID string FID                                   { printf("Id:%s",$2);}
       ;

Nome: ANOME string FNOME                                  { printf("Nome:%s",$2);}
    ;

Notas: Nota Notas
     |
     ;

Nota: ANOTA Uc Valor FNOTA
    ;

Uc: AUC string FUC                                        { printf("Uc:%s",$2);}
  ;

Valor: AVALOR string FVALOR                               { printf("Valor:%s",$2);}
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
