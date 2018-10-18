%{
 #include "y.tab.h"
%}

%%

switch			{return SWITCH; }
case 			{return CASE; }
default			{return DEFAULT;}
[0-9]+                {return number;}
[\t\n ]               ;	
[-+*/;\\=\(\)\{\}\>\<\'\:]            {return yytext[0];}
[_a-zA-Z][a-zA-Z_0-9]* {return id;}
\'[a-zA-Z]\'		{return ch;}
.                     {ECHO; yyerror ("unexpected character"); return 0;}

%%

int yywrap (void) {return 1;}
