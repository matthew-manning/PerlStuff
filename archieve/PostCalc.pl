#!/usr/bin/perl -w

use PostFixStack;

my $Data = PostFixStack->stack;
#$Data->add("10 6 7 99");
#$Data->printStack;
#$Data->plus;
#$Data->printStack;
#$Data->swap;
#$Data->printStack;

while(1)
{
	$Data->printStack;
	my $Input = <STDIN>;
	$Data->chooseCmd($Input);
}
