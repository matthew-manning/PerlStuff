package Bottle;

$ClassVar = 10;

sub create
{
	my $Invocant = shift;
	my $Class = ref($Invocant)||$Invocant;#gets class name for both instance and class calls of method 
	my $Data = {
	"capacity"=> 2,
	"material"=> "steel",
	"contents"=> "water",
	@_,};
	
	return bless($Data,$Class);
}

sub fill
{
	(@_ == 2)|| warn "call fill() with one supplied arg";#correct context on @_ ?
	local $Self = shift;
	$Self->{"contents"} = shift;#{contents} and {"contents"} are same
}

sub drink
{
	(@_==1)||warn "call drink() void";
	local $Self = shift;
	print "You drank ".$Self->{capacity}." litres of ".$Self->{contents}."\n";
}

sub classData
{
	print "Bottle.pm's \$ClassVar is: $ClassVar\n"; 
}

return 1;

