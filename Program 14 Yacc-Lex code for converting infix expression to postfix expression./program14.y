%{
#include<stdio.h>    
%}

%token NUM
%left '+' '-'
%left '*' '/'
%right NEGATIVE

%%
S: E {printf("\n\n");}
   ;
E: E '+' E  {printf("+");}
   |  E '*' E {printf("*");}
   |  E '-' E {printf("-");}
   |  E '/' E {printf("/");}
   |  '(' E ')'
   |  '-' E %prec NEGATIVE {printf("-");}
   |  NUM   {printf("%d", yyval);}
   ;
%%

int main()
{
    printf("Input infix expression : \n\n");
    yyparse();
}

int yyerror(char *msg)
{
    return printf("\n\nError YACC : %s \n\n", msg);
}