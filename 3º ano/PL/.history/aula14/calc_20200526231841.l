%{
#include "y.tab.h"
%}

%option yylineno
%%
[ \t\r\n] ;

!   return NOT;
==  return EQUAL;
\<  return LT;
\<= return LE;
\>  return GT;
\>= return GT;

;           return SEP;

[+*\-/=()]  return *yytext;

(?i:halt)   return HALT; 
(?i:print)  return PRINT;
(?i:read)   return READ; 
(?i:show)   return SHOW;
(?i:if)     return IF;
(?i:else)   return ELSE;

[0-9]+      { yylval.ivalue = atoi(yytext); return num; }
[a-z]       { yylval.cvalue= *yytext; return id; }

\/\/.*      {yylval.svalue = strdup(yytext+2); return comentario;}

\"[^"]*\"   {yylval.svalue = strdup(yytext); return string;}


.   return ERRO;
