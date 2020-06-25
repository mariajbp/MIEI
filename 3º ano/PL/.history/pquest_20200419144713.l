%option noyywrap

%{
#include <string.h> 
#include <stdlib.h>

char *eu;
char *ele;
int i;

%}

%x DefEU DefELE

%%
^(?i:eu)[ ]*\=[ ]*             { BEGIN DefEU; }
<DefEU> \..*\n                       { BEGIN INITIAL; }
<DefEU> [^.]+                       { eu = strdup(yytext);}


^(?i:ele)[ ]*\=[ ]*              { BEGIN DefELE; }
<DefELE> \..*\n                       { BEGIN INITIAL; }
<DefELE> [^.]+                         { ele = strdup(yytext);}


^(?i:eu)[ ]*\=[ ]*   { printf("%s:", eu); }

^(?i:ele)[ ]*\=[ ]*   { printf("%s:", ele); }
%%





int main() {
    eu = ele = "";
     yylex();
return(0); }