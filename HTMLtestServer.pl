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

my $Speed = 4.578898489498;


#while($Speed < 50)#while append to what is already sent
#{
	
	#my $DisplaySpeed = substr($Speed, 0, 4);#three sig fig on speed, is using string context
											#use a regex to pad front and 	
	
		
	print "got to a\n";
	my $Page = sprintf("
	<!DOCTYPE html>
	<html>
	<head>
	<title>Simple test page</title>
	</head>
	<body>
	<p>this is a line of text</p>
	<p><b> LET US BE bold!</b>
	<p>my velocity is %0.2f m/s/s </p>
	</body>							  
	</html>
	", $Speed);
	#^^need to format varible's degree of prescion along lines of
	# %0.2f
	
	print "page is $Page\n";

	print $ClientSock "$Page";
	print "sent page\n";
	#sleep 1; 					##################### will break web page, time out??

#}
close $ClientSock;


