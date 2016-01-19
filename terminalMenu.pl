#!/usr/bin/perl -w

use Term::Menus;#cpan

my $Header = "Select mode:";
my @Options = qw(quiet verbose normal);

my $Mode = &pick(\@Options,$Header);
print "Chosen mode is $Mode\n";
<STDIN>;

#scrolling

$Header = "Select file:";
@Options = `ls archieve/`;

$Mode = &pick(\@Options,$Header);
print "Chosen file is $Mode\n";
<STDIN>;

#multi choice

my %MenuOne = (
	Item_1 => 
	{
		Text => "entry ]Convey[",
		Convey =>  [`ls archieve/`],
	},
	Select => 'many',
	Banner => 'pick 1+ files:',
	);
	
my @Files = &Menu(\%MenuOne);

for my $FileName(@Files)
{
	$FileName =~ s/^entry //;#remove crap added to sart of line 
	print "file picked: $FileName\n"
}

#sub menus


