#!/usr/bin/perl -w

$String = "10 20 30 app";
@Array = qq/ $String /;

foreach $Item (@Array)
{
	print("item is $Item\n");
} 
