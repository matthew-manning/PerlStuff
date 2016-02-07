package SpecPrint;#name must match file name

use Exporter qw(import);

####export setup
our @ISA = (Exporter);
our @EXPORT = qw();#default export list, best practice to have empty to prevent name space pollution
our @EXPORT_OK = qw(firstLetters catPrint printModVer);#exported when requested by name
our $VERSION = 0.1;#this module's version number
our %EXPORT_TAGS = (#exported by tags
					all => [@EXPORT, @EXPORT_OK],
					silly => [qw(firstLetters)],
					controlled => [qw(printModVer)],#everything exported by tags needs to be avilable in defualt or request export lists
					);

####

sub catPrint#cats all args and prints with newline
{
	my $Output;
	for my $Arg (@_)
	{
		$Output .= $Arg." ";

	}
	chomp($Output);
	print "$Output\n";
}

sub firstLetters#takes string and prints first letter of each word
{
	my @Words = split(/ /, $_[0]);
	my $PrintString;
	for my $Word (@Words)
	{
		$PrintString .= ( split(//, $Word) )[0];
	}
	chomp($PrintString);
	print "$PrintString\n";
}
sub printModVer#print the module's version number
{
	print "module version is $VERSION\n";
}

1;
