%{
#include "y.tab.h"
%}

%%

[ \t\n\r] ;

\(    return yytext[0];
\)    return yytext[0];

(\+|\-)[0-9]+      {yyval.vint = atoi(yytext); return inteiro;}

. return ERRO;

