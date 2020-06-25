%%

Lista : Coord Lista
      | Coord

Coord : '(' num ',' num ')'
      ;


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