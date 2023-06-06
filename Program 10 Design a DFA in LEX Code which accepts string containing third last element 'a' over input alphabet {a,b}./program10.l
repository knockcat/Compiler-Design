%{
#include<stdio.h>
%}


%s A B C D E F G H
%%
<INITIAL>a BEGIN A;
<INITIAL>b BEGIN INITIAL;
<A>a BEGIN D;
<A>b BEGIN B;
<B>a BEGIN E;
<B>b BEGIN C;
<C>a BEGIN A;
<C>b BEGIN INITIAL;
<D>a BEGIN G;
<D>b BEGIN F;
<E>a BEGIN A;
<E>b BEGIN B;
<F>a BEGIN E;
<F>b BEGIN C;
<G>a BEGIN G;
<G>b BEGIN F;
<INITIAL>\n BEGIN INITIAL;printf("Not Accepted\n\n");
<A>\n BEGIN INITIAL; printf("\nNot Accepted\n\n");
<B>\n BEGIN INITIAL; printf("\nNot Accepted\n\n");
<C>\n BEGIN INITIAL; printf("\nAccepted\n\n");
<D>\n BEGIN INITIAL; printf("\nNot Accepted\n\n");
<E>\n BEGIN INITIAL; printf("\nAccepted\n\n");
<F>\n BEGIN INITIAL; printf("\nAccepted\n\n");
<G>\n BEGIN INITIAL; printf("\nAccepted\n\n");
<INITIAL>[^ab\n] BEGIN H;
<A>[^ab\n] BEGIN H;
<B>[^ab\n] BEGIN H;
<C>[^ab\n] BEGIN H;
<D>[^ab\n] BEGIN H;
<E>[^ab\n] BEGIN H;
<F>[^ab\n] BEGIN H;
<G>[^ab\n] BEGIN H;
<H>[^\n] BEGIN H;
<H>[\n] BEGIN INITIAL; printf("\nInvalid Input\n\n");
<H>EOF BEGIN INITIAL; printf("\nInvalid Input\n\n");
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter the String of a and b only : \n");
    yylex();
}