#!/usr/bin/perl -w

use PostFixStack;

my $Data = PostFixStack->stack("23 22 56");
$Data->add("10 6 7 99");
$Data->printStack;
$Data->plus;
$Data->printStack;
$Data->swap;
$Data->printStack;
