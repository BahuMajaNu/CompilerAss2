%{
#include <stdio.h>
%}

%start start
%token number,id, FOR


%%

 start 	: stmt '\\'	{printf ("Accepted"); return 0;}
	;

 stmt   : for
	| exp ';' 
	| stmt stmt          
        ;

 for	: FOR  '(' exp ';' boolexp ';' exp ')' '{' stmt '}'
 	;
 
 exp    : number
	| id		  
 	| id '=' exp op exp
 	| exp op exp
	| id '=' exp
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
