#! /usr/perl -w

$ButtonValue = ` xmessage -buttons 'one','two' "apples to keep:" -print`;
chomp $ButtonValue;
print $ButtonValue." apples will be kept\n";
