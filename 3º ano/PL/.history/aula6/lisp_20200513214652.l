%{
#include "y.tab.h"
%}

%%

[ \t\n\r] ;

[a-zA-z]*



. return ERRO;
