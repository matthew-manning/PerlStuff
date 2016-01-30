#!/usr/bin/perl -w
use Term::ANSIColor qw(:constants);
use List::Util "any";##need to update perl to latest version

my $Passed = $ARGV[0]||"";
#command line args




###print directory listing

my $DirString = `ls -d $Passed*/`;
#^add code to supress warning if use without args

my @DirArr = split /$/m, $DirString;
my $NumDirs = scalar(@DirArr)-1;

print BOLD, BLUE, "\n\n\nDirectories: $NumDirs\n", RESET;


##
for(my $i = 0; $i < $NumDirs; $i++)
{
	$DirArr[$i] =~ s/$Passed//;
	$DirArr[$i] =~ s/\///;
	print BLUE, $DirArr[$i];
	
}
print RESET;
##code above only works properly for one layer one of ls depth, ie. `ls perl/`





###File listing

my $FileString = `ls -B $Passed`;
my @FileArray = split /$/m, $FileString;
my @FilesToPrints;


#push all files(not in dir list) to printing array
for(my $i = 0; $i < scalar(@FileArray); $i++)
{
	if(any(@DirArr) ne $FileArray[$i])
	{
		push($FileArr, @FilesToPrint);
	}
}


my $NumFiles = scalar(@FilesToPrint)-1;

print BOLD, GREEN, "\nFiles and symlinks: $NumFiles\n", RESET;
print GREEN, "@FilesToPrint\n\n\n", RESET;

###Sym links
