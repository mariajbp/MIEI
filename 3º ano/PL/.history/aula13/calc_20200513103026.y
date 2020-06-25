%{
#include <stdio.h>
#include <string.h>
extern int yylex();
extern int yylineno;
extern char *yytext;
int yyerror();
int erroSem(char*);

int tabSimb[26] = {0};
%}

%union{
    int ivalue;
    char cvalue;
}

%token ERRO HALT PRINT READ SHOW 
%token <ivalue> num
%token <cvalue> id
%type <ivalue> num Fator Termo Exp
%type <cvalue> id

%%
Calc
    : {printf("\tpushn 26\nstart\n");} ListaComandos {printf("stop\n");}
    ;

ListaComandos
    : ListaComandos Comando { printf("Reconheci um comando!\n"); }
    | Comando { printf("Reconheci um comando!\n"); }
    ;  

Comando
    : Print 
	| Read 
	| Show 
	| Halt 
    | Atrib
	;

Print
    : PRINT Exp ';' {printf("writei\n");}
    ;

Read
    : READ id ';' {
                    printf("\tpushs \"Introduza um valor:\" \n\twrites\n\tread\n");
                    printf("\tstoreg %d\n", $2-'a');
                    tabSimb[$2-'a'] =  }
    ;

Show 
    : SHOW ';' {
        for(int i = 0;i<26;i++) 
                printf("\tpushg %d\n\twritei\n", i);
    }
    ;

Halt
    : HALT ';' { printf("stop\n."); return 0;}
    ;

Atrib 
    : id '=' Exp ';' {
        printf(" ",  $1-'a');
    }
    ;

Exp
    : Exp '+' Termo {$$ = $1+$3;}
    | Exp '-' Termo {$$ = $1-$3;}
    | Termo {$$ = $1;}
    ;

Termo 
    : Termo '/' Fator { if($3==0) erroSem("DIVISÃO POR 0");
                        else printf("\tdiv\n"); }
    | Termo '*' Fator {printf("\tmul\n");}
    | Fator {$$ = $1;}
    ;

Fator 
    : id {printf("\tpushg %d\n", $1-'a');}
    | num {printf("\tpushi %d\n", $1);}
    | '(' Exp ')'
    ;
%%

int main(){
    yyparse();
    return 0;
}

int erroSem(char *s){
    printf("Erro Semântico na linha: %d, %s...\n", yylineno, s);
    return 0;
}

int yyerror(){
    printf("Erro Sintático ou Léxico na linha: %d, com o texto: %s\n", yylineno, yytext);
    return 0;
}

