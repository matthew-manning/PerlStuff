#!/usr/bin/perl

sub changeA
{
	@_[0] = 45;
	
	print "function changes it to $_[0]\n";
}

$a = 33;
print '$a starts as '.$a."\n";
&changeA($a);
print '$a'." is now $a\n";
