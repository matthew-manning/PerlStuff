#!/usr/bin/perl -w

open(LOGFILE, "<", "logFile.txt");
$Line = <LOGFILE>;

print "\$Line = $Line\n";
close LOGFILE;
