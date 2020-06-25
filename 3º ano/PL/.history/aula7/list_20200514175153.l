%{
#include "y.tab.h"
%}

%%

[ \t\n\r] ;

\[                 return(yytext[0]);
\]                 return(yytext[0]);
\,                 return(yytext[0]);

[\+|\-]?[0-9]+     return(yytext[0]);


. return ERRO;

%%