
%{
#include<stdio.h>
int lineCount=0,spaceCount=0,tabCount=0,restCount=0;
%}

%%
[\n] {++lineCount;}
[" "] {++spaceCount;}
[\t] {++tabCount;}
[^\t" "\n] {++restCount;}
END {return 0;}
%%

int yywrap()
{
	return 1;
}

int main()
{
	printf("Enter the Sentence : \n");
	yylex();
	
	printf("Number of Lines are : %d\n",lineCount);
	printf("Number of Spaces are : %d\n",spaceCount);
	printf("Number of Tabs Characters are : %d\n",tabCount);
	printf("Number of Rest Characters are : %d\n",restCount);
	
	return 0;
}
