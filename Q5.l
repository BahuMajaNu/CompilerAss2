%{
 #include "y.tab.h"
%}

%%

#define			{return DEFINE; }
[0-9]+                	{return number;}
[\t\n ]               ;	
[-+*/;\\=\(\)\{\}\>\<\'\:]            {return yytext[0];}
[_a-zA-Z][a-zA-Z_0-9]* 	{return id;}
.                     {ECHO; yyerror ("unexpected character"); return 0;}

%%

int yywrap (void) {return 1;}
