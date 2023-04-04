
%{
#include<stdio.h>
int totChars=0,whiteSpace=0,wordCount=0;
%}

%%
[ \n\t] {++whiteSpace;}
[^ \n\t]+ {++wordCount; totChars=totChars+yyleng;}
%%

int yywrap()
{
    return 1;
}

int main()
{
    extern FILE *yyin;
    yyin = fopen("input.txt","r");

    yylex();

    printf("White Spaces : %d\nWords : %d\nTotal Characters : %d\n",whiteSpace,wordCount,whiteSpace+totChars);

    return 0;
}

// enter tabs and spaces are counted as whiteSpace
