%{
#include <stdio.h>
#include <string.h>

extern int yylex();
extern int yylineno;
extern char* yytext;

int yyerror();
int erroSem(char*);
%}

%union{
    int ivalue;
    char cvalue;
    char *svalue;
}

%token ERRO HALT PRINT READ SHOW SEP IF ELSE NOT EQUAL LT LE GT GE
%token <ivalue> num
%token <cvalue> id
%token <svalue> comentario string
%type <ivalue> Exp Termo Fator
%%


Calc: {printf("\tpushn 26\nstart\n");} ListaComandos {printf("stop\n");}
    ;

ListaComandos: ListaComandos Comando 
             | Comando 
             ;  

Comando: Print 
       | Read 
       | Show  
       | Atrib
       | Comment
       | IfElse
       ;

ifElse: IF '('Cond ')' Comando SEP
      | IF '('Cond ')' Comando ELSE { printf("else:\n");} Comando { printf("fimIF:\n");}
      ;

Comment: comentario  {printf("//%s\n", $1);}
       ;

Print: PRINT Exp SEP { 
        printf("\twritei\n"); 
        printf("\tpushs \"\\n\"\n");
        printf("\twrites\n");
    }
    | PRINT string SEP {printf("\tpushs \"%s\"\ntwrites\nwritei\n", $2)}
    ;

Read: READ id SEP {
        printf("\tpushs \"Introduza um valor: \"\n");
        printf("\twrites\n");
        printf("\tread\n");
        printf("\tatoi\n");
        printf("\tstoreg %d\n", $2-'a'); 
    }
    ;

Show: SHOW SEP {
        for(int i=0;i<26;i++){
            printf("\tpushg %d\n\twritei\n", i);
            printf("\tpushs \", \"\n");
            printf("\twrites\n");
        }   
    }
    ;

Atrib: id '=' Exp SEP { printf("\tstoreg %d\n", $1-'a'); }
    ;


Cond: RelExp
    ;

RelExp: Exp
      | Exp EQUAL Exp
      | NOT RelExp
      | Exp LT Exp
      | Exp LE Exp
      | Exp GT Exp {printf("\tsup\n");}
      | Exp GE Exp
      ;    

Exp: Exp '+' Termo { printf("\tadd\n"); }
    | Exp '-' Termo { printf("\tsub\n"); }
    | Termo 
    ;

Termo: Termo '/' Fator {
        if($3 !=0 ) 
            printf("\tdiv\n");
        else 
            erroSem("Divisão por 0!");
    }
    | Termo '*' Fator { printf("\tmul\n"); }
    | Fator 
    ;

Fator: id { printf("\tpushg %d\n", $1-'a'); }
     | num { printf("\tpushi %d\n", $1); }
     | '(' Exp ')' 
     ;



%%



int main(){
    yyparse();
    return 0;
}

int erroSem(char *s){
    printf("Erro Semântico na linha: %d: %s\n", yylineno, s);
    return 0;
}

int yyerror(){
    printf("Erro Sintático ou Léxico na linha: %d, com o texto: %s\n", yylineno, yytext);
    return 0;
}
