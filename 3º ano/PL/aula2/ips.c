%%
(([0-9]){1,3}\.){3}[0-9]{1,3} {printf("%s: pode ser um ipv4", yytext);}

.+$   printf("%s: VÁLIDO \n", yytext);

\n ;

%%