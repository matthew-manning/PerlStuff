#!/usr/bin/perl -w

use Term::Menus;#cpan

my $Header = "Select mode:";
my @Options = qw(quiet verbose normal);

my $Mode = &pick(\@Options,$Header);
print "Chosen mode is $Mode\n";

#scrolling

$Header = "Select file:";
@Options = `ls archieve/`;

$Mode = &pick(\@Options,$Header);
print "Chosen file is $Mode\n";
