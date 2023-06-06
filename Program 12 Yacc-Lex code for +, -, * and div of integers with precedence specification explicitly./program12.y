%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
%}

%token digit
%left '+' '-'
%left '*' '/'

%%
S:S E'\n' {$$=$2; printf("\n\nOutput = %d\n\n",$$);}
 | ;
E:E '+' E {$$=$1+$3;}
 |E '-' E {$$=$1-$3;}
 |E '*' E {$$=$1*$3;}
 |E '/' E {$$=$1/$3;}
 |digit   {$$ = $1;}
 ;
%%

int main()
{
    printf("Enter Arithmetic Expression : \n\n");
    yyparse();
    return 0;
}

void yyerror(char *msg)
{
    printf("\n\n%s", msg);
    printf("\n\nArithmetic Expression is Invalid\n\n");
}