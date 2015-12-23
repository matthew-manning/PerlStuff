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
$CommitCmd = 'git commit -m'.$CommitMsg;

system('git commit -m first');
#system(('git commit -m '.$CommitMsg))
