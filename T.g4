grammar T;

@header{
Package com.example;
}

prog :  Initializer Rules Endif Oncompletetion
     |  Initializer Rules Endif
     |  Initializer Rules Oncompletetion
     |  Initializer Rules
     ;
Initializer: InitInitializer ':'VarList;
VarList: '-' VarList (';' | ',') Identifier '=' Int+
            | ((';' | ',') Identifier '=' Int+ ';')+
            | (Identifier '=' Int+ ';')+
            ;
Rules: Rule ;

Rule: (ScaledVar SpecialOperator)+ScaledVar',';
ScaledVar:(Identifier Operator)* Identifier
         ;
Operator: '+'|'*';
SpecialOperator: 'to'|'cont'|'->';
Endif: 'Notfloat';
Oncompletetion: 'maybeInt';
Seperator:':'|',';
Assign: '=';
Identifier: Int*('a'..'z'|'A'..'Z')+;
Int: ('0'..'9')+;
Float: 'float';
InitInitializer: 'Initialize';
