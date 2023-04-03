
%{
#include<stdio.h>
int integerCount=0,floatCount=0;
%}

%%
-?[0-9]+ {++integerCount; printf("\tInteger : %s",yytext);}
-?[0-9]+"."[0-9]+ {++floatCount; printf("\tFloat = %s",yytext);}
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter Input : ");
    yylex();

    printf("\nTotal Number of Integer = %d and Float = %d\n",integerCount,floatCount);

    return 0;
}
