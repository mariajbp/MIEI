%{
#include "y.tab.h"
%}

%%

[ \t\n\r] ;


(\+|\-)[0-9]+      {yyval.vint = atoi(yytext); return inteiro;}

. return ERRO;

