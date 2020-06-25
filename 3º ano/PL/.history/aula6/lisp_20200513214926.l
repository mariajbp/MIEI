%{
#include "y.tab.h"

#define AP  1000
#define FP  1001
#define pal 1002
#define num 1003
%}

%%

[ \t\n\r] ;

\(   return(AP);
\)   return(FP);

[a-zA-z]+   return(pal);
[0-9]+      return(num);



. return ERRO;
