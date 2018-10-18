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

 for	: FOR  '(' exp ';' exp ';' exp ')' '{' stmt '}'
 	;
 
 exp    : number
	| id		  
 	| id '=' exp '+' exp
	;
%%

 int main (void) {return yyparse ( );}

 void yyerror (char *s) {fprintf (stderr, "%s\n", s);}
