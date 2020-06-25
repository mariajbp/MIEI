%{
#include "y.tab.h"
%}

%x conteudo


%%

[ \t\n\r] ;




. return ERRO;