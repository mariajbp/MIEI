%{
    #include <stdio.h>
    extern int yylex();
%}


%union
{
    float fval;
    char* sval;
}


%token TRUE FALSE NULLVALUE ERRO string num
%type <fval> num
%type <sval> string Value Obj


%%

Json: Value                    {printf("%s\n", $1);}
    ;
 
Obj: '{''}'                    {}
   | '{' PairList '}'          {}                
   ;

PairList: Pair                 {}
        | Pair PairList        {}
        ;

Pair: string ':' Value         {}                   
    ;

Array: '['']'                  {}
     | '[' ValueList ']'       {}
     ;

ValueList: Value                  {} 
         | ValueList ',' Value    {}
         ;


Value: string                  { $$ = strdup($1); }
     | num                     { asprintf(&$$, "%f", $1); }
     | Obj                     { asprintf(&$$, "%s", $1); }
     | Array                   { asprintf(&$$, "%s", $1); }
     | TRUE                    { asprintf(&$$, "true"); }
     | FALSE                   { asprintf(&$$, "false"); }
     | NULLVALUE               { asprintf(&$$, "null"); }
     ;

%%


int main()
{
    yyparse();
    return 0;
}

int yyerror(char *)
{
    printf("Erro sintático: %s\n", s);
    return 0;
}

// Numa atribuição direta pode usar-se strdup()
// asprintf() usa-se para uma escrita formatada 


//Na linha 45 -> Em Value o num é um float e o Value é um char* o que dá conflito 
// é preciso usar o asprintf e é passado por referencia o $$ 

//Na linha 46 é copiar o que está já definido em Obj para o value

//Na linha 48 o true e o false não têm qualquer valor associado