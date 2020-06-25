%%

Json: Value
    ;

Obj: '{''}'
   | '{' PairList '}'
   ;

PairList: Pair
        | Pair PairList
        ;

Pair: string ':' Value
    ;

Array: '['']'
     | '[' ValueList ']'
     ;

ValueList: Value
         | ValueList ',' Value
         ;


Value: string
     | num
     | Obj
     | Array
     | TRUE
     | FALSE
     | NULL


%%