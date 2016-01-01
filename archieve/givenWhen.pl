#!/usr/bin/perl -w

#given-when is currently experimental 
#and should not be used as it is 
#not stable.

use feature "switch";

$Fruit = "pineapple";

given($Fruit)
{
	when("pineapple")
	{print "pineapple is juciy\n";}
	when("apple")
	{print "apple is tart\n";}
	when("mango")
	{print "mango has a hard pip\n"}
}
