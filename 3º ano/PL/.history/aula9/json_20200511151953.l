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
                                        yytext[yyleng-1] = '\0';          //retira as aspas da string
                                        yylval.sval = strdup(yytext+1);     //o tipo de svalue é char* logo tem que se alocar espaço
                                        return string;
                                    }

(\+|\-)?[0-9]+(\.[0-9]+)?           {yylval.fval = atof(yytext); return num;}


. return ERRO;

