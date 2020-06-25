%%




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