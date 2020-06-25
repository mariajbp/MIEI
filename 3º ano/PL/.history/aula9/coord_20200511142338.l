%{
#include "y.tab.h"
%}

%%

[ \t\n\r] ;

\(  yytext[0];
\)  yytext[0];
\,  yytext[0];


(\+|\-)?([1-9]?[0-9]|1[0-9][0-9])(\.[0-9]+)? {yylval.vreal = atof(yytext); return num;}