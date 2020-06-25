%{
#include "y.tab.h"
%}

%%

[ \t\n\r] ;

\+
\-          {yylval.sval = strdup(yytext+1); return}

[0-9]+      {yyval.vint = atoi(yytext); return inteiro;}

. return ERRO;

