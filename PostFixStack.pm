package PostFixStack;

use warnings;

our %LookUp = (
	"+" => \&PostFixStack::plus,
	"-" => \&PostFixStack::minus,
	"/" => \&PostFixStack::divide,
	"*" => \&PostFixStack::multiply,
	);


sub stack
{
	my $Invoc = shift;
	my$Class = ref($Invoc)||$Invoc;
	return bless([], $Class);
}

sub chooseCmd
{
	my $Stack = shift;
	chomp(my $Cmd = shift);#text str from user
	
	
	
	if($Cmd eq "exit")
	{
		exit;
	}
	elsif($Cmd eq "del")
	{
		$Stack->delete;
	}
	elsif($Cmd eq "swap")
	{
		$Stack->swap;
	}
	elsif ( !($Cmd =~ /\+|\-|\/|\*/) )#add to stack
	{
		$Stack->add($Cmd);
	} 
	else#operators
	{
		print "\$Cmd is: $Cmd\n";
		my $Function = $LookUp{$Cmd};
		print "\$Function is: $Function\n";
		&$Function($Stack);
	}
	
}

sub printStack
{
	system("clear");
	my $Stack = shift;
		
	print "\n";
	for(my $i = 10; $i > 0; $i--)
	{
		my $Val = $Stack[$i-1]||" ";#default to single space 
		print "$i:\t".$Val."\n";
	}
	print "\n";
}


sub delete
{
	my $Stack = shift;
	my $Check = shift @Stack;
	
	print "stack is empty\n" unless $check;
}

sub swap#swaps bottom two items
{
	my $Stack = shift;
	if($Stack[0]&&$Stack[1])#check both exist
	{
		($Stack[0], $Stack[1]) = ($Stack[1], $Stack[0]);
	}
	else
	{
	print "not enough items\n";
	}
}
sub add#adds items to stack
{
	my $Stack = $_[0];
	my @Passed = split(" ", $_[1]);#passed as "3 10 5 99 etc", pushed LHS->RHS
	for my $Val (@Passed)
	{
		unshift(@Stack, $Val);
	}
}

sub plus
{
	my $Stack = shift;
	my $Val1 = shift(@Stack);
	my $Val2 = shift(@Stack);
	
	print "\$Val1 is: $Val1\n\$Val2 is: $Val1\n";
	if ($Val1&&$Val2)#check both exist
	{
		unshift(@Stack, $Val1 + $Val2);
	}
	else
	{
	print "not enough items\n";
	}
}

sub minus
{
	my $Stack = shift;
	my $Val1 = shift(@Stack);
	my $Val2 = shift(@Stack);
	
	if($Val1&&$Val2)#check both exist
	{
		unshift(@Stack, $Val2-$Val1);
	}
	else
	{
	print "not enough items\n";
	}
}

sub multiply
{
	my $Stack = shift;
	my $Val1 = shift(@Stack);
	my $Val2 = shift(@Stack);
	
	if($Val1&&$Val2)#check both exist
	{
		unshift(@Stack, $Val2*$Val1);
	}
	else
	{
	print "not enough items\n";
	}
}

sub divide
{
	my $Stack = shift;
	my $Val1 = shift(@Stack);
	my $Val2 = shift(@Stack);
	
	if($Val1&&$Val2)#check both exist
	{
		unshift(@Stack, $Val2/$Val1);
	}
	else
	{
	print "not enough items\n";
	}
}


return 1;
