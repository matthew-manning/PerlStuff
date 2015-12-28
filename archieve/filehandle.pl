#!/usr/bin/perl -w

if ( ! open PASSWD, "logFile.txt"){
	die " ($!)";
}

while (<PASSWD>) {
	if(/Date|Time/)
		{
			print ;
			print "\n";
		}
		
}
