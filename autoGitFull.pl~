# use -set flag to manual set remote & branch

#!/usr/bin/perl -w 

unless(`ls -a` =~ /\.autogit/)#check for auto git foleder
{
	mkdir '.autogit', 0755 or warn "cannot create .autogit directory: $!\n";
	print " dir doesn't exist\n";
}

#parse user commit message or supply default
my $CommitMsg = 'regular commit';#if none supplied
if(@ARGV)
{
	$CommitMsg = '';
	foreach $Word (@ARGV)
	{
		$CommitMsg .= $Word.' ';
	} 
	
}

#check for manual conf flag
if($CommitMsg =~ /\-set/)
{
	config();
	exit;
}

unless(`ls .autogit` =~ /config\.txt/)#create config file if doesn't exist
{
	print "could not find config file\n";
	config();
}
else#check file not currupt
{
	open(CONFIG, '<', '.autogit/config.txt');
	
	#check remote tag & one or more characters for remote name
	unless(<CONFIG> =~ /Remote: ./)
	{
		print "config file corrupted, please re-enter data\n\n";
		config();
	}
	else{#check branch tag & one or more characters for branch name
		unless(<CONFIG> =~ /Branch: ./)
		{
			print "config file corrupted, please re-enter data\n\n";
			config();
		}
		close CONFIG;
		}
}


open(CONFIG, "<", '.autogit/config.txt') || die "cannot open, error in program for this to happen:\n$!";

chomp(my $Line = <CONFIG>);
my $Remote = substr( $Line, 8);
chomp(my $Line = <CONFIG>);
my $Branch = substr( $Line, 8);


system('git add *');

system(('git', 'commit', '-m '.$CommitMsg));

system(('git','push', $Remote, $Branch));


sub config
{
	open(CONFIG, '>', '.autogit/config.txt') || die "cannot create config file: $!\n";
	print "enter remote to use: ";
	print CONFIG "Remote: ".<STDIN>;
	print "enter branch to use: ";
	chomp(my $Line = <STDIN>); 
	print CONFIG "Branch: ".$Line;
	close CONFIG;
	chmod 0755, "config.txt";	
}




