#!/usr/bin/perl -w

#recives file from server, line by line
$| = 1;#auto flush

use IO::Socket::INET;

my $Sock = IO::Socket::INET->new(
PeerHost => '127.0.0.1',
PeerPort => '2400',
)|| die "could not connect to port 2400:\n$!\n";


while(<$Sock>)
{
	chomp;
	print  "$_\n" 
}
close $Sock;
