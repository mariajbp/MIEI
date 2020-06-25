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
    : READ id ';' {printf("\tpushs \"Introduza um valor:\"\n\twrites\n\tread\n");}
    ;

Show 
    : SHOW ';' {
        for(int i = 0;i<26;i++) 
            if(tabSimb[i] != 0) printf(">> %c: %d\n", i + "a", tabSimb[i]);
    }
    ;

Halt
    : HALT ';' { printf(">> Volte sempre."); return 0;}
    ;

Atrib 
    : id '=' Exp ';' {
        tabSimb[$1-'a'] = $3;
        printf(">> %c: %d\n", $1, $3);
    }
    ;

Exp
    : Exp '+' Termo {$$ = $1+$3;}
    | Exp '-' Termo {$$ = $1-$3;}
    | Termo {$$ = $1;}
    ;

Termo 
    : Termo '/' Fator { if($3==0) erroSem("DIVISÃO POR 0");
                        else $$ = $1/$3; }
    | Termo '*' Fator {$$ = $1*$3;}
    | Fator {$$ = $1;}
    ;

Fator 
    : id {$$ = tabSimb[$1-'a'];}
    | num {$$ = $1;}
    | '(' Exp ')' {$$ = $2;}
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


/**
coisas mais prioritarias no nivel mais baixo da arvore

$$ é o valor associado ao fator

vamos ter só 26 registos e cada letra minuscula corresponde a um registo

$$ tabSum[$1-'a'] subtrair o codigo ascii da letra a
**/