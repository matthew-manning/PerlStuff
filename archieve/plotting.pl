#!/usr/bin/perl -w

$XTitle = "x";
$YTitle = "Y";
$ChartTitle = "Un-named";

@X1Vals = ();
@Y1Vals = ();

open(DATAFILE, "<","plottingData.txt")||die "Failed to open data file:$!\n";

while(<DATAFILE>)
{
	chomp;
	if(/NAME:/)
	{
		$ChartTitle = substr($_, index($_,':')+1 );
	}
	elsif(/X:/)
	{
		$XTitile = substr($_, index($_,':')+1 );
	}
	elsif(/Y:/)
	{
		$YTitle = substr($_, index($_,':')+1 );
	}
	elsif(/X1:/)
	{
		$_ = substr($_,index($_,':')+2);#remove X1: and first space
		@X1Vals = split / /;#, $_;
		
	}
	elsif(/Y1:/)
	{
		$_ = substr($_,index($_,':')+2);#remove Y1: and first space
		@Y1Vals = split / /;#, $_;
		
	}

}
print "chart title is $ChartTitle\nX axis title is $XTitle\nY axis title is $YTitle\n";
for($i = 1; $i <= $#X1Vals+1; $i++)
{
	print "X$i is $X1Vals[$i-1], Y$i is $Y1Vals[$i-1] \n";
}
