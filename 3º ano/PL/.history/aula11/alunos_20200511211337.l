%{
#include "y.tab.h"
%}

%x conteudo


%%


[ \t\n\r] ;

\<\?xml[ \t\n]+version=\"1\.0\"[ \t\n]*\?\> return DECL;

\<alunos\>       return AALUNOS;
\<\/alunos\>     return FALUNOS;

\<aluno\>        return AALUNO;
\<\/aluno\>      return FALUNO;

\<id\>           {BEGIN conteudo; return AID;}
\<\/id\>         return FID;

\<nome\>         {BEGIN conteudo; return ANOME;}
\<\/nome\>       return FNOME;

\<notas\>        {BEGIN conteudo; return ANOTAS;}
\<\/notas\>      return FNOTAS;

\<nota\>         {BEGIN conteudo; return ANOTA;}
\<\/nota\>       return FNOTA;

\<uc\>           {BEGIN conteudo; return AUC;}
\<\/uc\>         return FUC;

\<valor\>        {BEGIN conteudo; return AVALOR;}
\<\/valor\>      return FVALOR;

<conteudo>[^\<]*  { BEGIN INITIAL; 
                    yylval.svalue = strdup(yytext); 
                    return string; }


. return ERRO;

