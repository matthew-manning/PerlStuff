#!/usr/bin/perl -w
use Term::ANSIColor qw(:constants);



###print directory listing

my $DirString = `ls -d $ARGV[0]*/`;
#^add code to supress warning if use without args

my @CountArr = split /\//,$DirString;
#^only used to to count number of dirs
my $NumDirs = scalar(@CountArr)-1;

print BOLD, BLUE, "\n\n\nDirectories: $NumDirs\n", RESET;
print BLUE, $DirString, RESET;

###File listing

my $FileString = `stat -c "%F %n" * | grep "regular file" | cut -d' ' -f 3-`;
#^figure out how to exclude/remove backup files
