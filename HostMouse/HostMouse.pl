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

$OldVal = "";
while (1)
{
	while(<$Sock>)
	{
		chomp;
		print "$_ aa\n";
		
		
		if( $_ )#ne $OldVal)
		{
			@MouseData = split(',',$_);
			foreach(@MouseData)
			{
				print "$_ bb\n";
			}
			print "cc\n";
			
										
			$ScaleFactor = ($MouseData[3]/1000)*$PixelFactor;
			
			@DeltaPixels = ($MouseData[0]*$ScaleFactor, $MouseData[1]*$ScaleFactor, $MouseData[2]*$ScaleFactor);
			
		}
		$OldVal = $_; ##act once for each message, is this needed with the "while(<$Sock>)" ?? 
		
	}
}
close $Sock;
