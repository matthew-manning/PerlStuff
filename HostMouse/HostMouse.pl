#!/usr/bin/perl -w

#sends  messages
use IO::Socket::INET;
$| = 1;#autoflush on

my $Sock = IO::Socket::INET->new(
PeerHost => '192.168.0.114',		##put in code to nmap and automaticly put this number in
PeerPort => 4000,
Blocking => 0


)|| die "could not create connection to socket on port 4000:\n$!\n";

print "connected\n";

my $PixelFactor = 6;#scale of pixels moved per metre moved real space
my $CyclePeriod = 20;

$OldVal = "";
while (1)
{
	while(<$Sock>)
	{
		chomp;
		print "$_ aa\n";
		
		
		if( $_ )
		{
			@MouseData = split(',',$_);
			foreach(@MouseData)
			{
				print "$_ bb\n";
			}
			print "cc\n";
			
										
			$ScaleFactor = ($CyclePeriod/1000)*$PixelFactor;
			
			@DeltaPixels = (int($MouseData[0]*$ScaleFactor), int($MouseData[1]*$ScaleFactor), int($MouseData[2]*$ScaleFactor));
			
			$Command = "xdotool mousemove_relative -- $DeltaPixels[0] $DeltaPixels[1]";
								 
			
			system($Command);
			
		}
		
		
	}
}
close $Sock;
