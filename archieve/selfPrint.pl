#!/usr/bin/perl -w
#program prints self without comments

open(SELF_FILE,"<","selfPrint.pl")||die "$!\n"; 

while(<SELF_FILE>)
{
	chomp;

	unless(/#!/)#perserves shebang
	{
		@Line = split(/#/);
		$_ = $Line[0];
		
	}
	unless(!$_)#unless string is void
	{
		print "$_\n";
	}
	else
	{	
		print "\n"
	}
}
