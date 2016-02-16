#!/usr/bin/perl -w

use Time::HiRes;

my $StartTime = Time::HiRes::time();
system("@ARGV");
my $EndTime = Time::HiRes::time();

my $TimeTaken = int(($EndTime-$StartTime)*1000);#convert and truncate to milliseconds

print "****\napproximate time taken was: $TimeTaken ms\n****\n\n";
