%option noyywrap

D [0-9]
%%
[-+*/()]        return yytext[0];
{D}+            yylval.in = atoi(yytext); return Int;
{D}+"."{D}+     yylval.dbl = atof(yytext); return Double;
\n              return Newline;
