%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
%}

%token digit
%%
S:S E'\n' {$$=$2; printf("\n\nOutput = %d \n\n",$$);}
 | ;
E:E '+' T {$$=$1+$3;}
 |E '-' T {$$=$1-$3;}
 |T       {$$=$1;}
 ;
T:T '*' F {$$=$1*$3;}
 |T '/' F {$$=$1/$3;}
 |F       {$$=$1;}
 ;
F:digit   {$$=$1;}
%%

int main()
{
    printf("Enter Arithmetic Expressions : \n\n");
    yyparse();
    return 0;
}

void yyerror(char *msg)
{
    printf("\n\n%s", msg);
    printf("\n\n Invalid Arithmetic Expression\n\n");
}