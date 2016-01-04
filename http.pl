#!/usr/bin/perl -w

use HTTP::Tiny;

my $URL = 'https://metacpan.org';
my $Response = HTTP::Tiny->new->get($URL);

if($Response->{"success"})
{
	my $HTML = $Response->{"content"};
	print $HTML;
}
else {die "failed\n"; }
