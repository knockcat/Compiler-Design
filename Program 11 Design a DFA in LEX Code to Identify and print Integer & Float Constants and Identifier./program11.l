%{
#include<stdio.h>
%}

%s A B C D Y Z
%%
<INITIAL>[A-Za-z_] BEGIN B;
<INITIAL>[0-9] BEGIN A;
<INITIAL>[.] BEGIN Y;
<INITIAL>[^A-Za-z0-9_.\n] BEGIN Z;
<INITIAL>\n BEGIN INITIAL;printf("  Not accepted\n ");
<A>[.] BEGIN C;
<A>[0-9] BEGIN A;
<A>[A-Za-z_] BEGIN Y;
<A>[^A-Za-z0-9_.\n] BEGIN Z;
<A>\n BEGIN INITIAL; printf( "Integer\n" );
<B>[A-Za-z_] BEGIN B;
<B>[0-9] BEGIN B;
<B>[.] BEGIN Y;
<B>[^A-Za-z0-9_.\n] BEGIN Z;
<B>\n BEGIN INITIAL; printf( "Identifier\n" );
<C>[0-9] BEGIN D;
<C>[.] BEGIN Y;
<C>[A-Za-z_] BEGIN Y;
<C>[^A-Za-z0-9_.\n] BEGIN Z;
<C>\n BEGIN INITIAL; printf( "  Not Accepted\n" );
<D>[0-9] BEGIN D;
<D>[.] BEGIN Y;
<D>[A-Za-z_] BEGIN Y;
<D>[^A-Za-z0-9_.\n] BEGIN Z;
<D>\n BEGIN INITIAL; printf( "Float\n" );
<Y>[A-Za-z0-9_.] BEGIN Y;
<Y>[^A-Za-z0-9_.\n] BEGIN Z;
<Y>[\n] BEGIN INITIAL; printf("  Not Accepted\n");
<Z>[^\n] BEGIN Z;
<Z>[\n] BEGIN INITIAL; printf("  Invalid Input\n");
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter the char [A-Za-z0-9_.] only : \n ");
    yylex();
}