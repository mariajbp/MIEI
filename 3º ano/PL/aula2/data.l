%% 
[0-9]{4}-(0[1-9]|1[0-2])-[0-9]{2} {printf("%s", yytext)};
                                    int dia = atoi(yytext+8);

}

. ;