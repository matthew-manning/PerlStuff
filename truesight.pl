#!/usr/bi/perl -w

unless($ARGV [1])#if no mode flag passed
{
	my $File =$ARGV[0];

	my $Data = `getfattr -n user.truesightdata $File`;
	
	$Data =~ s/# file: $File\nuser.truesightdata="//;#removes junk from printed string
	
	
	###need to reaplace \012 with newline
	$Data =~ s/\\012/\n/g;# /g is gobal, replace *ALL* matches  
	
	$Data =~ s/"\n$//;#remove more junk
	
	
	print "\n\n$Data\n\n";
}
else
{
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
	
		###user entered
		my $PassedStr;
		for(my $i = 2; $i < scalar(@ARGV); $i++)
		{
			$PassedStr .= ($ARGV[$i]." ");
		}
		
		my $File = $ARGV[0];
	
	
		###get exiting data
		my $Data = `getfattr -n user.truesightdata $File`;
	
		$Data =~ s/# file: $File\nuser.truesightdata="//;#removes junk from printed string
		$Data =~ s/ "\n$//;
		
		
		$PassedStr = $Data.$PassedStr;
		system("setfattr -n user.truesightdata -v \"$PassedStr\" $File")
	
	}
	elsif($ARGV[1] eq '-f')#replace with named file
	{
		local $/ = undef;#read entire file with <>
		open(FILE, '<', "$ARGV[2]")||die "could not open file: $!\n";
		my $FileData = <FILE>;
		
		my $File = $ARGV[0];
		
		##
		print("File data:\n$FileData");
		##
		
		system("setfattr -n user.truesightdata -v \"$FileData\" $File");
		
		
	}
	elsif($ARGV[1] eq '-fa')#append named file
	{
	
	}
	else#read mode on passed file
	{	
		print "invalid mode flag\n";
	}
}
