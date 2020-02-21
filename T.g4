grammar T;

@header{
Package com.example;
}

prog :  Initializer Rules Endif Oncompletetion
     |  Initializer Rules Oncompletetion
     |  Initializer Rules Endif
     |  Initializer Rules
     |  Initializer Oncompletetion
     |  Initializer
     ;
Initializer: InitInitializer ':'VarList;
VarList: '-' VarList (';' | ',') Identifier '=' Int+
            | ((';' | ',') Identifier '=' Int+ ';')+
            | (Identifier '=' Int+ ';')+
            ;
Rules: InitRule ':' (Rule)+;

Rule: (ScaledVar SpecialOperator)+ScaledVar',' Rate;
ScaledVar:(Identifier Operator)* Identifier;

Rate: ('(' Int+ ')'','|'('Int+ ',' Int+')'',')*('('Int+ ',' Int+')'';'|'(' Int+ ')'';');

Endif: InitEnd ':' (EndCond Compare EndCond';')+;
EndCond: ((TreeSize|Identifier) '+')* (TreeSize|Identifier);

Oncompletetion: InitCompletion ':' Print+;
Print: 'print("'String'");';
String: (Char|Int|Float|' ')+;
WHITESPACE : ' ' -> skip ;
Operator: '+'|'*';
SpecialOperator: 'to'|'cont'|'->';
Seperator:':'|',';
Assign: '=';
Char: ('a'..'z'|'A'..'Z');
Identifier: Int*('a'..'z'|'A'..'Z')+;
Int: ('0'..'9')+;
Float: 'float';
Compare: '=' | '<' | '>' | '!';
TreeSize: 'Depth'|'Iterations'|'Time';

InitInitializer: 'Initialize';
InitRule: 'Rules';
InitEnd: 'EndIf';
InitCompletion: 'OnComplition';
