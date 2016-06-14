#!/usr/bin/perl -w

#sends  messages
use IO::Socket::INET;
$| = 1;#autoflush on


my $Sock = IO::Socket::INET->new(
PeerHost => '192.168.0.109',
PeerPort => 4000,


)|| die "could not create connection to socket on port 4000:\n$!\n";

print "enter to close:\n";

while(1)
{
	print ">>>";
	chomp(my $Msg = <STDIN>);
	if($Msg)
	{
		print $Sock "$Msg\n";
	}
	else
	{
	close $Sock;
	exit;
	}
}
