%{
#include "y.tab.h"
%}

%%

[ \t\n\r] ;

\<\?xml[ \t\n]+version=\"1\.0\"[ \t\n]*\?\> return DECL;

\<alunos\>    return AALUNOS;
\<\/alunos\>  return FALUNOS;

\<aluno\>     return AALUNO;
\<\/aluno\>   return FALUNO;

\<id\>     return AID;
\<\/id\>   return FID;

\<nome\>     return ANOME;
\<\/nome\>   return FNOME;

\<notas\>     return ANOTAS;
\<\/notas\>   return FNOTAS;

\<nota\>     return ANOTA;
\<\/nota\>   return FNOTA;

\<uc\>     return AUC;
\<\/uc\>   return FUC;

\<valor\>     return AVALOR;
\<\/valor\>   return FVALOR;

[a-zA-Z]*


. return ERRO;

