grammar T;

@header{
Package com.example;
}

prog :  Initializer ':' Rules ':' Endif ':' Oncompletetion
     |  Initializer ':' Rules ':' Endif
     |  Initializer ':' Rules ':' Oncompletetion
     |  Initializer ':' Rules
     ;
Initializer: '-' InitInitializer ':' ' ' Initializer (';' | ',') Var '=' Int+
           | InitInitializer ':' ' ' Var '=' Int+ ';'
           | Var '=' Int+ ';'
           ;
Rules: 'float';
Endif: 'Notfloat';
Oncompletetion: 'maybeInt';
Seperater:':'|',';
Assign: '=';
Var: 'a'..'z'|'A'..'Z';
Int: ('0'..'9')+;
Float: 'float';
InitInitializer: 'Initialize';
