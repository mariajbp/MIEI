sinal (\+|\-)
iss [1-9][0-9]*
dec \.\d+

%%
\({sinal}?({iss}|0){dec}?,\ {sinal}?({iss}|0){dec}?\)$ { printf("Válido! %s\n", yytext);}

.* printf("Inválido: %s\n", yytext);

%%