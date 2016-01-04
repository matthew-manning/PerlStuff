#!/usr/bin/perl -w
use Time::HiRes;

$| = 1;
sub retroOut
{
	$Line = shift;
	@Chars = split(//,$Line);
	for my $Sym (@Chars)
	{
		print $Sym;
		Time::HiRes::usleep(170000);#0.17 sec per symbol
		if($Sym eq "\n")
		{
			Time::HiRes::usleep(230000);#0.4 sec delay for new lines
		}
	}

}

sub decodePrint
{
	$Line = shift;
	@Chars = split(//,$Line);
	$SpinCount = 4;
	
	for my $Sym (@Chars)
	{
		for(my $i = 0; $i < $SpinCount; $i++)
		{
			$Junk = chr( int(rand(255)) );#print random ascii character
			$Junk =~ s/^[a-zA-Z0-1]/q/;
			##^^  have to remove randomly occuring new lines, carrage returns etc
			
			print $Junk;
			Time::HiRes::usleep(90000);#0.09 sec per char
			print chr(0x08)#cursor left one place 
		}
		
		print $Sym;
		Time::HiRes::usleep(100000);#0.10 sec before next symbol
		if($Sym eq "\n")
		{
			Time::HiRes::usleep(200000);#0.30 sec delay for new lines
		}
	}

}


retroOut "Slow enough?\n";
decodePrint "how does this look?\n"
