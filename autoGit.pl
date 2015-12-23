#!/usr/bin/perl -w 

#parse user commit message or supply defluat
$CommitMsg = 'regular commit';#if none supplied
if(@ARGV)
{
	$CommitMsg = '';
	foreach $Word (@ARGV)
	{
		$CommitMsg .= $Word.' ';
	} 
	
}

system('git add *');

system(('git', 'commit', '-m '.$CommitMsg));

system(('git','push', 'origin','master',";","mbhmanning\@gmail.com\n"));

