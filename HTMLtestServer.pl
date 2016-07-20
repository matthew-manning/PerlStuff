#!/usr/bin/perl -w

#receives messages
$| = 1;
use IO::Socket::INET;

my $Sock = IO::Socket::INET->new(
LocalHost => '192.168.0.105',
LocalPort => 80,
Listen => 1,



)|| die "could not create listen socket on port 80:\n$!\n";

print "listening on port 80\n";
my $ClientSock = $Sock->accept();
print "accepted a connection\n";


	
#my $ReceivedMsg = <$ClientSock>;#need to read the connecting socket
#print "message is:	$RecivedMsg\n" if($RecivedMsg);

my $Speed = 4.57;

while($Speed < 50)#while append to what is already sent
{
	
	
		
	print "got to a\n";
	my $Page = "
	<!DOCTYPE html>
	<html>
	<head>
	<title>Simple test page</title>
	</head>
	<body>
	<p>this is a line of text</p>
	<p><b> LET US BE bold!</b>
	<p>my velocity is $Speed m/s/s </p>#need to format varible's degree of prescion along lines of
	</body>							   # %0.2f
	</html>
	";
	print "page is $Page\n";

	print $ClientSock "$Page";
	print "sent page\n";
	sleep 1;
	$Speed += 0.1;
}
close $ClientSock;


