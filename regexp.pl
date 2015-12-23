#!/usr/bin/perl -w


open (PASSWD, "<" ,"logFile.txt")||die " ($!)";


$MatchBlk = 0;
while (<PASSWD>) {
	if(/Date|Time|Header:/)
	{
		print;
		$MatchBlk = 1;
	}
	elsif($MatchBlk)
	{
		print "\n";
		$MatchBlk = 0;
	}
}
