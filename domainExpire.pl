#!/usr/bin/perl -w

use Net::Domain::ExpireDate;


print "give address: ";
chomp(my $Adr = <STDIN>);

print "$Adr expires ".expire_date($Adr)."\n\n";
