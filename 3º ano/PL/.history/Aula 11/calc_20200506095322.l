%{
#include "y.tab.h"
%}

%%
[ \t\n\r] ;

[+\-*()=;] return yytext[0];

/* combinaçoes maisuclas e minusculas */

(?i:halt)           return HALT;
(?i:print)          return PRINT; 
(?i:read)           return READ; 
(?i:show)           return SHOW; 

/* Acrescentar o valor à union */
[0-9]+              {yylval.ivalue = atoi(yytext);  return num;}

/* id é uma letra minuscula e entrava em conflito com os de cima 
   caso o id não apanhasse sempre mais caraters pq faz match com o maior*/

[a-z]               {yyval.cval = yytext[0];   return id;}

. return ERRO;
