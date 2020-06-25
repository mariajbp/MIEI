%option noyywrap

%{
#include <string.h> 
#include <stdlib.h>

char *eu;
char *ele;

%}

%x DefEU DefELE

%%
^(eu|EU)(\ )?(=|\:)               { BEGIN DefEU; }
<DefEU> \n                        { BEGIN INITIAL; }
<DefEU>[^.]+                      { eu = strdup(yytext);}

^(ele|ELE)(\ )?(=|\:)               { BEGIN DefELE; }
<DefELE> \n                         { BEGIN INITIAL; }
<DefELE>[^.]+                       { ele = strdup(yytext);}


^(eu|EU)(\ )?(=|\:)  { printf("%s:", eu); }
^(ele|ELE)(\ )?(=|\:)   { printf("%s:", ele); }
%%





int main() {
    eu = ele = "";
     yylex();
return(0); }