package HipFlask;
use parent qw/ Bottle /;

$ClassVar = "apples on a tree";

sub drink
{
	$Self = shift;
	print "you nipped $Self->{capacity} litres of $Self->{contents}\n";
}
sub swill
{
	$Self = shift;
	$Self->SUPER::drink;#super can only be called in method, not from a instance
}

return 1;
