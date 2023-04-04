
%{
#include<stdio.h>
%}

%%
"//"[^\n]* ;
"/*"([^*]|[*]+[^/])*[*]+"/" ;
%%

int yywrap()
{
    return 1;
}

int main()
{
    extern FILE *yyin,*yyout;

    yyin=fopen("input.c","r");
    yyout=fopen("output.c","w");

    yylex();

    return 0;
}

// the code will write the program written in input.c to output.c after removing comments.