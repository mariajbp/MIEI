%{
    #include <stdio.h>
    extern int yylex();
    int yyerror();
%}


%%

Json: Value
    ;

Obj: '{''}'
   | '{' PairList '}'
   ;

PairList: Pair
        | Pair PairList
        ;

Pair: string ':' Value
    ;

Array: '['']'
     | '[' ValueList ']'
     ;

ValueList: Value
         | ValueList ',' Value
         ;


Value: string
     | num
     | Obj
     | Array
     | TRUE
     | FALSE
     | NULL


%%


int main()
{
    yyparse();
    return 0;
}

int yyerror()
{
    printf("Erro sintático \n");
    return 0;
}