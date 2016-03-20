package Node;


sub make
#pass:
#(contents, self node id, joined node 1, joined 2, joined 3)
{
	my $Invocant = shift;
	my $Class = ref($Invocant)||$Invocant;
	my $Data = {
		contents => shift,
		id => shift,
		join1 => shift,
		join2 => shift,
		joint3 => shift};
	
	return bless($Data, $Class);
}

sub getId
{
	return $_[0]->{"id"};
}

sub ownContents
{
	$_[0]->{"contents"};
}


sub neighborIds
{
	my $Self = shift;
	my @ReturnList;
	
	unshift( @ReturnList, $Self->{"join1"}->{"id"} );
	unshift( @ReturnList, $Self->{"join2"}->{"id"} );
	unshift( @ReturnList, $Self->{"join3"}->{"id"} );
}

sub neighborContents
#pass 
#(depth)
{
	my $Self = shift;
	my $DepthLeft = shift;
	my @ReturnList;
	
	if(DepthLeft > 1)#recurive call for depth
	{
		unshift( @ReturnList, $Self->{"join1"}->neighborContents($DepthLeft-1) );
		unshift( @ReturnList, $Self->{"join2"}->neighborContents($DepthLeft-1) );
		unshift( @ReturnList, $Self->{"join3"}->neighborContents($DepthLeft-1) );
		return @ReturnList;
	}
	
	else
	{
		unshift( @ReturnList, $Self->{"join1"}->{"contents"} );
		unshift( @ReturnList, $Self->{"join2"}->{"contents"} );
		unshift( @ReturnList, $Self->{"join3"}->{"contents"} );
		return @ReturnList;
	}
}


return 1;
