
%{
#include<stdio.h>
int count=0;
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {++count; printf("\tValid Identifier = %s",yytext);}
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter Input : \n");
    yylex();

    printf("Total Number of Valid Identifier = %d\n",count);

    return 0;
}