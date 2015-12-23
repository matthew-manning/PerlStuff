#!/usr/bin/perl -w

%Hash = 
(
'apple' => 'fruit',
carrot => 'vegatable',
almond => 'nut'
);

foreach $Food (qw/apple carrot almond/)
{
	print "$Food is a $Hash{$Food}\n";
}
