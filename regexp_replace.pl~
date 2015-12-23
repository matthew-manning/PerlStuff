#!/usr/bin/perl -w

open(LOGFILE, "<logFile.txt")|| die "No such file: $!";

while(<LOGFILE>)
{
	chomp;
	if(/Time|Date|Header/)
	{
		print "orignal line was:\n$_\n";
		#convert to all upper case
		s/Date/DATE/;
		s/Time/TIME/;
		s/Header/HEADER/;
		print "coverted to:\n$_\n";
		
	}
}
