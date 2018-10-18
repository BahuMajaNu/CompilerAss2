%{
 #include "y.tab.h"
%}

%%

if			{return IF; }
else			{return ELSE;}
[0-9]+                {return number;}
[\t\n ]               ;	
[-+*/;\\=\(\)\{\}\>\<]            {return yytext[0];}
[_a-zA-Z][a-zA-Z_0-9]* {return id;}
.                     {ECHO; yyerror ("unexpected character"); return 0;}

%%

int yywrap (void) {return 1;}
