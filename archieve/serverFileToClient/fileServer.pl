#!/usr/bin/perl -w

use IO::Socket::INET;

$| = 1;#auto flush

open(FILE, '<', 'file.txt')||die "could not open file.txt:\n$!\n";

my $Sock = IO::Socket::INET->new(
LocalHost => '192.168.0.105',
LocalPort => '80',
Listen => '1',
)||die "could not create socket on port 80:\n$!\n";
print "listening on port 2400\n";

$ClientSock = $Sock->accept();
print "accepted a connection\n";

while(<FILE>)
{
	chomp;
	print $ClientSock "$_\n";
}
 print "finished sending file\n";
close FILE;
close $ClientSock;
