
%{
#include<stdio.h>
int lc = 0, sc = 0, tc = 0, ch=0, wc = 0;
%}

%%
[\n] 	  { ++lc; ch += yyleng; }
[  \t]    { ++sc; ch += yyleng; }
[^\t] 	  { ++tc; ch += yyleng; }
[^\t\n ]+ { ++wc; ch += yyleng; }
%%

int yywrap()
{
	return 1;
}

int main()
{
	printf("Enter The Sentence : ");
	yylex();
	
	printf("Number of Lines             : %d\n",lc);
	printf("Number of Spaces            : %d\n",sc);
	printf("Number of Tabs              : %d\n",tc);
	printf("Number of Total characters  : %d\n",ch);
	printf("Number of Words             : %d\n",wc);
	printf("Number of Other Characters  : %d\n",ch - (lc+sc+tc));
	
	return 0;
}

