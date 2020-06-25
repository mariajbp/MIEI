%{
#include "y.tab.h"
%}

%%

[ \t\n\r] ;

\(   return(yytext[0]);
\)   return(yytext[0]);

[a-zA-z]+   return(pal);
[0-9]+      return(num);


. ;

%%