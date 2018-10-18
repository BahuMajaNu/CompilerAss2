%{
#include <stdio.h>
%}

%start start
%token number, id, SWITCH, ch, CASE, DEFAULT


%%

 start 	: stmt '\\'	{printf ("Accepted"); return 0;}
	;

 stmt   : switch
	| exp ';' 
	| stmt stmt          
        ;

 switch	: SWITCH  '(' exp ')' '{' casestmt defaultstmt '}'
 	;

 casestmt: CASE casesel ':' stmt
	;

 casesel: ch
	| number
	;

 defaultstmt: DEFAULT ':' stmt
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
	 	
%%

 int main (void) {return yyparse ( );}

 void yyerror (char *s) {fprintf (stderr, "%s\n", s);}
