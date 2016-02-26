#!/usr/bi/perl -w

#open(OUTFILE, '>', "testingFile" )||die "could not create file: $!";

#$PublicFile = "What do you see here?\n";

#print(OUTFILE, $PublicFile);

###tack on to exitsing file

#usage
#
#truesight datafile [flag] passedvalue

if($ARGV[1] eq '-w')#write passed string as new data
{
	my $PassedStr;
	for(my $i = 2; $i < scalar(@ARGV); $i++)
	{
		$PassedStr .= ($ARGV[$i]." ");
	}
	
	my $File = $ARGV[0];
	
	system("setfattr -n user.truesightdata -v \"$PassedStr\" $File");
}
elsif($ARGV[1] eq '-wa')#append passed string
{

}
elsif($ARGV[1] eq '-f')#replace with named file
{

}
elsif($ARGV[1] eq '-fa')#append named file
{

}
else#read mode on passed file
{
	my $File =$ARGV[0];

	my $Data = `getfattr -n user.truesightdata $File`;
	
	print "$Data\n"
}
