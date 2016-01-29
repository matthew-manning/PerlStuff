#!/usr/bin/perl -w
use Term::ANSIColor qw(:constants);

$DirString = `ls -d $ARGV[0]*/`;
#^add code to supress warning if use without args

$CountArr = split /\//m, $DirString;
#^only used to to count number of dirs
$NumDirs = scalar(@CountArr);

print "Count array is @CountArr\n";

print BOLD, BLUE, "\n\n\nDirectories: $NumDirs\n", RESET;
print BLUE, $DirString, RESET;
