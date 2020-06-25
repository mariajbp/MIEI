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

true        return TRUE;
false       return FALSE;
null        return NULLVALUE;

\"[^"]*\"                           {
                                        yytext[yyleng-1] = '\0'; //retira as aspas da string
                                        yyval.sval = char*
                                        return string;
                                    }

(\+|\-)?[0-9]+(\.[0-9]+)?           {yylval.fval = atof(yyext); return num;}


. return ERRO;

