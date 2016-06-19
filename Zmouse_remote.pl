#!/usr/bin/perl -w


#receives messages
$| = 1;
use IO::Socket::INET;

my $Sock = IO::Socket::INET->new(
LocalHost => '127.0.0.1',
LocalPort => 4000,
Listen => 1,



)|| die "could not create listen socket on port 4000:\n$!\n";

print "listening on port 4000\n";
my $ClientSock = $Sock->accept();
print "accepted a connection\n";


while(1)
{
	
	my $Com = <$ClientSock>;#need to read the connecting socket
	
	if($Com)
	{
		system($Com);
	}

}
