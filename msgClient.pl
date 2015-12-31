#!/usr/bin/perl -w

#sends  messages
use IO::Socket::INET;
$| = 1;#autoflush on


my $Sock = IO::Socket::INET->new(
PeerHost => '127.0.0.1',
PeerPort => 4000,


)|| die "could not create connection to socket on port 4000:\n$!\n";



chomp(my $Msg = <STDIN>);
print "\$msg is $Msg\n";
print $Sock "$Msg\n";

print "own socket msg is ".<$Sock>."\n";

print "enter to close:";
<STDIN>;
print "\n\n";
close $Sock;
