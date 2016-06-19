#!/usr/bin/perl -w

my $HostWidth = 1336; #screen width of remote
my $HostHeight = 768;

my $ClientWidth = 1680; #screen width of ssh'ing computer
my $ClientHeight = 1050;

#sends  messages
use IO::Socket::INET;
$| = 1;#autoflush on


my $Sock = IO::Socket::INET->new(
PeerHost => '127.0.0.1',
PeerPort => 4000,


)|| die "could not create connection to socket on port 4000:\n$!\n";

while(1)
{
	$_ = `xdotool getmouselocation`;
	m/x:.../; #x location of mouse
	my $MX = $1;
	$MX = substr($MX, 2);# not sure on offset
	
	m/y:.../;
	my $MY = $1;
	$MY = substr($MY, 2);

	#scaling for different screen sizes
	$MX = int(($MX/$ClientWidth)*$HostWidth);
	$MY = int(($MY/$ClientHeight)*$HostHeight);
	
	$Com =  "xdotool mousemove $MX $MY";
	print $Sock $Com;
	
}
