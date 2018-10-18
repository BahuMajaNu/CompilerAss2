%{
#include <stdio.h>
%}

%start start
%token number, id, IF, ELSE


%%

 start 	: stmt '\\'	{printf ("Accepted"); return 0;}
	;

 stmt   : if
	| exp ';' 
	| stmt stmt          
        ;

 if	: IF  '(' boolexp ')' '{' stmt '}' ELSE '{' stmt '}'
 	;
 
 exp    : number
	| id		  
 	| id '=' exp op exp
 	| exp op exp
	;
	
 op	: '+'
 	| '-'
 	| '*'
 	| '/'
 	;
	
 boolexp: exp relop exp
 	;
 	
 relop	: '>'
 	| '<'
 	| '>' '='
 	| '<' '='
 	| '=' '='
 	;
 	
%%

 int main (void) {return yyparse ( );}

 void yyerror (char *s) {fprintf (stderr, "%s\n", s);}
