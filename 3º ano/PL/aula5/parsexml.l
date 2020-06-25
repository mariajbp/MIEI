%{
    int abre = 0, fecha = 0, atrib = 0, comentarios = 0, vazios =0;
%}
%x abertura xml
qname [a-zA-Z][a-zA-z0-9_\-.:]*
ws [ \t]*
%%
    BEGIN 0;

[ \t\n] ;

\<\?xml[^?]+\?\> BEGIN xml;

<xml>\<!\-\-[^\-]*\-\-\> comentarios++;

<xml>\/[^>]+\>    fecha ++; 

<xml>\<{qname} BEGIN abertura;

<abertura>\> { abre++; BEGIN xml; }
<abertura>\/\> { vazios++; BEGIN xml; }

<abertura>{qname}{ws}={ws}\"[^"]+\" atrib++;

<<EOF>> { printf("\nAbrem: %d, Fecham: %d, Atributos: %d, Comentarios: %d, Vazios: %d\n", abre, fecha, atrib,comentarios,vazios);
                return 1; }
%%