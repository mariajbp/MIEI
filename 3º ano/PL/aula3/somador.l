%{
    int soma = 0;
%}

%%
[0-9]+ soma += atoi(yytext);
.|\n ;
%%
int yywrap(){
    printf("O resultado da soma é: %d\n", soma);
    return 0;
}
