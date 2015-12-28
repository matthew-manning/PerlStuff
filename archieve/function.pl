#! /usr/bin/perl -w

sub catStrs
{
	my $NumItems = @_;
	my $CatStr = '';
	for(my $i = 0; $i < $NumItems; $i++)
	{
		$CatStr = $CatStr.$_[$i];
	}
	
	$CatStr;
}

print &catStrs("apple ", 'tree on',' the beach',".\n");
