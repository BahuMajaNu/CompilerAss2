%{
#include <stdio.h>
%}

%union {int a_number;}
%start line
%token <a_number> number
%type <a_number> exp

%%

 line   : exp '\n'          {printf ("Result is %d\n", $1); return 0;}
        ;
 exp    : number		     {$$ = $1 ;}
 	| exp ' ' number ' ' '+'     {$$ = $1 + $3 ;}
 	| exp ' ' number ' ' '-'     {$$ = $1 - $3 ;}
 	| exp ' ' number ' ' '*'     {$$ = $1 * $3 ;}
 	| exp ' ' number ' ' '/'     {$$ = $1 / $3 ;}
	;
%%

 int main (void) {return yyparse ( );}

 void yyerror (char *s) {fprintf (stderr, "%s\n", s);}
