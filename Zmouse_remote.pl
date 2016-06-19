#!/usr/bin/perl -w

#system('ssh 192.0.168.109');
#$_ = `ssh 192.0.168.109`;
#system('echo "drunk jester"');
#system('export DISPLAY=:0');

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
