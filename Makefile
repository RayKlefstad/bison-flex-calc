calc: calc.y lex.yy.c
	bison calc.y; /bin/mv calc.tab.c calc.tab.cpp
	g++ calc.tab.cpp -o calc

lex.yy.c: calc.l
	flex -t calc.l > lex.yy.c

clean:
	/bin/rm -f calc lex.yy.c calc.tab.cpp
