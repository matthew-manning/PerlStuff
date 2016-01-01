#!/usr/bin/perl -w

#scalar
$ActualString = "apple";
$StrPnt = \$ActualString;
print "current scalar value = $$StrPnt\n";#$$ is derefence, each EXTRA $ dereferences one \
$$StrPnt = "pies";
print "currnet scalar value = $ActualString\n\n";

#Array
@ActualArray = (12,22,44);
$ArrPnt = \\@ActualArray;
print "array is @$$ArrPnt\n";#$$ is derefence, each $ dereferences one \

print "array's first element is @$$ArrPnt[0]\n\n";#syntax for get the first element, which is a SCALAR;

#hash
%ActualHash = (
"apple" => "fruit",
"pumpkin" => "vegatable"
);
$HashPnt = \%ActualHash;
print "hash{pumpkin} is a $$HashPnt{'pumpkin'}\n\n";#note $$ snytax

#function		

sub printStr
{
	print "string\n";
}

$SubPnt = \&printStr;
&$SubPnt();

$AnonymousSubPnt = sub{print "do I truly exist?\n\n"};
&$AnonymousSubPnt();

#dubious shit
$PreDecPnt = \$NotYet;
$NotYet = 100;
print "\$NotYet is $$PreDecPnt\n\n";
