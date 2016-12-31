#! /usr/bin/perl/ -w

use strict;

use GD::Graph::lines;

my @TimeData;
my @MainWave;
my @NoiseWave;
my @Combined;
my @LowPassed;
my @HighPassed;
my @SubNoise;

my $Samples = 1000;
my $SampPerSec = 500;

for(my $i = 0; $i < $Samples; $i++)
{
	print "i is $i\n";
	$TimeData[$i] = $i / $SampPerSec;
	$MainWave[$i] = 1 * sin($TimeData[$i]*20);# 20hz?
	$NoiseWave[$i] = 0.15 * sin($TimeData[$i]*240);#240hz?;
	$Combined[$i] = $MainWave[$i] + $NoiseWave[$i];
	
	
}

my $GraphMain = GD::Graph::lines->new(1000,1000);

$GraphMain->set(
	x_label => "time (s)",
	y_label => "amplitude",
	title => "main wave plot",
	#y_max_value => 2,#max(@MainWave) + 1,
	y_tick_number => 10,
	transparent => 0,
	
	
);

#############main wave

my @Data = ([@TimeData], [@MainWave]);

my $MainImg = $GraphMain->plot(\@Data);# | die "main wave graph did not work: $GraphMain->error\n";

open(IMAGE, '>', "mainwave.png");
binmode IMAGE;
print IMAGE $MainImg->png;
close IMAGE;

#############noise wave
my $GraphNoise = GD::Graph::lines->new(1000,1000);

$GraphNoise->set(
	x_label => "time (s)",
	y_label => "amplitude",
	title => "noise wave plot",
	#y_max_value => 1,#max(@MainWave) + 1,
	y_tick_number => 10,
	transparent => 0,
);

my @Data2 = ([@TimeData], [@NoiseWave]);

my $NoiseImg = $GraphNoise->plot(\@Data2);# | die "noise wave graph did not work: $GraphMain->error\n";

open(IMAGE, '>', "noisewave.png");
binmode IMAGE;
print IMAGE $NoiseImg->png;
close IMAGE;

#############combined wave
my $GraphComb = GD::Graph::lines->new(1000,1000);

$GraphComb->set(
	x_label => "time (s)",
	y_label => "amplitude",
	title => "combined wave plot",
	#y_max_value => 1,#max(@MainWave) + 1,
	y_tick_number => 10,
	transparent => 0,
);

my @Data3 = ([@TimeData], [@Combined]);

my $CombImg = $GraphComb->plot(\@Data3);# | die "noise wave graph did not work: $GraphMain->error\n";

open(IMAGE, '>', "combinedwave.png");
binmode IMAGE;
print IMAGE $CombImg->png;
close IMAGE;

#####low pass filter

$LowPassed[0] = $Combined[0];
for(my $i =1; $i < $Samples; $i++)
{
	$LowPassed[$i] = $LowPassed[$i - 1] + ( ($Combined[$i] - $LowPassed[$i - 1]) / 8);
}

my $GraphLP = GD::Graph::lines->new(1000,1000);

$GraphLP->set(
	x_label => "time (s)",
	y_label => "amplitude",
	title => "low passed wave plot",
	#y_max_value => 1,#max(@MainWave) + 1,
	y_tick_number => 10,
	transparent => 0,
);

my @Data4 = ([@TimeData], [@LowPassed], [@Combined]);

my $LPImg = $GraphLP->plot(\@Data4);# | die "noise wave graph did not work: $GraphMain->error\n";

open(IMAGE, '>', "LPwave.png");
binmode IMAGE;
print IMAGE $LPImg->png;
close IMAGE;

#####high pass filter

$HighPassed[0] = $Combined[0];
for(my $i =1; $i < $Samples; $i++)
{
	$HighPassed[$i] = ($HighPassed[$i - 1] + ( ($Combined[$i] - $HighPassed[$i - 1]) * 4000)) /4000;
	if($HighPassed[$i] > 10)
	{
		$HighPassed[$i] = 10;
	}
	elsif($HighPassed[$i] < -10)
	{
		$HighPassed[$i] = -10;
	}
	
}

my $GraphHi = GD::Graph::lines->new(1000,1000);

$GraphHi->set(
	x_label => "time (s)",
	y_label => "amplitude",
	title => "high passed wave plot",
	#y_max_value => 12,#max(@MainWave) + 1,
	y_tick_number => 10,
	transparent => 0,
);

my @Data5 = ([@TimeData], [@HighPassed], [@Combined],[@MainWave]);

my $HiImg = $GraphHi->plot(\@Data5);# | die "noise wave graph did not work: $GraphMain->error\n";

open(IMAGE, '>', "Highwave.png");
binmode IMAGE;
print IMAGE $HiImg->png;
close IMAGE;

#####subtract the low filter results from the combined signal to get the noise

$SubNoise[0] = $Combined[0];
for(my $i =1; $i < $Samples; $i++)
{
	$SubNoise[$i] = $Combined[$i] - $LowPassed[$i];

}

my $GraphSub = GD::Graph::lines->new(1000,1000);

$GraphSub->set(
	x_label => "time (s)",
	y_label => "amplitude",
	title => "subtracted wave plot",
	#y_max_value => 12,#max(@MainWave) + 1,
	y_tick_number => 10,
	transparent => 0,
);

my @Data6 = ([@TimeData], [@SubNoise],[@Combined],[@LowPassed]);

my $SubImg = $GraphSub->plot(\@Data6);# | die "noise wave graph did not work: $GraphMain->error\n";

open(IMAGE, '>', "Subwave.png");
binmode IMAGE;
print IMAGE $SubImg->png;
close IMAGE;
