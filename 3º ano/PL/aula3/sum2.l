%{
    int soma = 0;
    int flag = 0;
%}
%%
\+  if(flag) flag = 0; else flag=1;
=   printf("Soma = %d\n", soma);
[0-9]+ if(flag) soma += atoi(yytext);
.|\n ;
%%
int yywrap(){
    printf("O resultado da soma é: %d\n", soma);
}