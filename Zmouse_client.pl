#!/usr/bin/perl -w
use Time::HiRes qw | usleep |; ####needs to run with perlbrew

my $HostWidth = 1336; #screen width of remote
my $HostHeight = 768;

my $ClientWidth = 1680; #screen width of ssh'ing computer
my $ClientHeight = 1050;

#sends  messages
use IO::Socket::INET;
$| = 1;#autoflush on


my $Sock = IO::Socket::INET->new(
PeerHost => '192.168.0.109',
PeerPort => 4000,


)|| die "could not create connection to socket on port 4000:\n$!\n";

while(1)
{

#########################################################movement
	$_ = `xdotool getmouselocation`;
	m/(x:\d*)/; #x location of mouse
	my $MX = $1;
	$MX = substr($MX, 2);
	
	m/(y:\d*)/;
	my $MY = $1;
	$MY = substr($MY, 2);

	#scaling for different screen sizes
	$MX = int(($MX/$ClientWidth)*$HostWidth);
	$MY = int(($MY/$ClientHeight)*$HostHeight);
	
	$Com =  "xdotool mousemove $MX $MY";
	if($Com)
	{
		#print "\$com is $Com\n";
		print $Sock "$Com\n";#\n required to actually send data
	}
###########################################################clicking (LMB)
	#use xdotool behave call to track clicks
	
	usleep(20000); #20ms
}
