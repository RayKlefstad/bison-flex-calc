%{
#include <iostream>
#define yyerror(s) cerr << "ERROR: " << s << endl
using namespace std;
int yylex(void);
%}


%union
{
    int in;
    double dbl;
}

%token Newline
%token <in> Int
%token <dbl> Double
%type <dbl> E T F

%%
start:
    expr
|   start expr
;

expr:
    E Newline {cout << $1 << endl;}
;

E:
    E '+' T {$$ = $1 + $3;}
|   E '-' T {$$ = $1 - $3;}
|   T { $$ = $1; }
;

T:
    T '*' F {$$ = $1 * $3;}
|   T '/' F {$$ = $1 / $3;}
|   F { $$ = $1; }
;

F:
    Int { $$ = static_cast<double>($1); }
|   Double { $$ = $1; }
|   '(' E ')' {$$ = $2;}
;

%%

#include "lex.yy.c"

int main()
{
    yyparse();
}
