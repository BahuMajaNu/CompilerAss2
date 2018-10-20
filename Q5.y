%{
#include <stdio.h>
%}

%start start
%token number, id, DEFINE


%%

 start 	: stmt '\\'	{printf ("Accepted"); return 0;}
	;

 stmt   : define
	| exp  
	| stmt stmt          
        ;

 define	: DEFINE  id stmt
 	;
 
 exp    : number
	| id		  
 	| id '=' exp op exp
	| id '=' exp
 	| exp op exp
	;
	
 op	: '+'
 	| '-'
 	| '*'
 	| '/'
 	;
	 	
%%

 int main (void) {return yyparse ( );}

 void yyerror (char *s) {fprintf (stderr, "%s\n", s);}
