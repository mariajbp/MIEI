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

\<Uc\>           {BEGIN conteudo; return AUC;}
\<\/Uc\>         return FUC;

\<Valor\>        {BEGIN conteudo; return AVALOR;}
\<\/Valor\>      return FVALOR;

<conteudo>[^\<]*  { BEGIN INITIAL; 
                    yylval.svalue = strdup(yytext); 
                    return string; 
                  }


. return ERRO;

