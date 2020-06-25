%%
(_|\.)[0-9]+[a-z A-Z]{3,}(_|[a-z A-Z])$ printf("%s: VÁLIDO\n", yytext);

(([0-9]){1,3}\.){3}[0-9]{1,3} {printf("%s: pode ser um ipv4", yytext);}

.+$   printf("%s: VÁLIDO \n", yytext);

\n ;

%%