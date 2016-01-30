#!/usr/bin/perl -w
use Term::ANSIColor qw(:constants);
use List::Util "any";##need to run "perlbrew switch perl-5.23.4" in terminal before

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
my @FilesToPrint;


#push all files(not in dir list) to printing array
for(my $i = 0; $i < scalar(@FileArray); $i++)
{
	if(!(any{$_ eq $FileArray[$i]} @DirArr))
	{

		push(@FilesToPrint, $FileArray[$i]);
	}
}


my $NumFiles = scalar(@FilesToPrint);

print BOLD, GREEN, "\nFiles: $NumFiles", RESET;
print GREEN, "@FilesToPrint\n\n\n", RESET;

###Sym links
