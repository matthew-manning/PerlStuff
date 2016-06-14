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
	
	my @JunkList = ('a'..'z','A'..'Z',0..9);
	

	for my $Sym (@Chars)
	{	
		unless($Sym eq "\n")#skips junk print for newlines
		{
			for(my $i = 0; $i < $SpinCount; $i++)  
			{
				$JunkIdx =  int(rand(61));#for printing random letter/number character
				$Junk = $JunkList[$JunkIdx];
				##^^  map number to character
			
				print $Junk;
				(`play click.wav 2> /dev/null`);#click noise
				#Time::HiRes::usleep(60000);#0.06 sec per char
				print chr(0x08)#cursor left one place 
			}
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


