%{
#include "y.tab.h"
%}

%%

[ \t\n\r] ;

\, return yytext[0];
\[ return yytext[0];
\] return yytext[0];
\{ return yytext[0];
\} return yytext[0];
\: return yytext[0];

true return TRUE;
false return FALSE;
null return NULL;

\"[^"]*\" return string;



. return ERRO;

