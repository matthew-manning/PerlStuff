#!/usr/bin/perl -w

#sends  messages
use IO::Socket::INET;
$| = 1;#autoflush on

#for nonblocking socket
#use Fcntl;


my $Sock = IO::Socket::INET->new(
PeerHost => '192.168.0.114',
PeerPort => 4000,
Blocking => 0


)|| die "could not create connection to socket on port 4000:\n$!\n";

print "connected\n";

#print "setting nonblocking\n";

#my $Flags = "";
#fcntl($Sock, F_GETFL, $Flags) || die "could not get flags\n$!\n";

#print "flags are $Flags\n";
#$Flags |= O_NONBLOCK;
#print "flags are now $Flags\n";

#fcntl($Sock, F_SETFL, $Flags) || die "could not set flags\n$!\n";

#=pod
#while(1)
#{
#	$MsgRec = <$Sock>;
#	if ($MsgRec)
#	{
#		chomp($MsgRec);
#		print "MsgRec \n";
#	} 
#}
#=end
while (1)
{
	while(<$Sock>)
	{
		chomp;
		print "$_\n";
	}
}
close $Sock;
