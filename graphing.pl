#!/usr/bin/perl -w

use GD::Graph::lines;

#data
#@X1 = (1,2,3,4,5,6,7,8,9,10);
#@Y1 = (12,33,43,25,14,5,-1,5,66,8);
#@Data = (@X1, @Y1);
@Data = (
		[1,2,3,4,5],	#x
		[2,3,-5,10,7]	#y
		);


#generate
my $Plot = GD::Graph::lines->new(1400,1400);
$Plot->set(
x_label 		=> "distance",
y_label 		=> "height",
title 			=> "height Vs distance",
y_max_value 	=> 70,
y_tick_number 	=> 10,
y_label_skip	=> 2
)|| die "could not set plot: $!\n";
my $PlottedImage = $Plot->plot(\@Data) || die "plotting failed: $!";

#write to file
open(OUTFILE, ">","temp.jpeg") || die "couldnot create temp image file: $!\n";
binmode OUTFILE;
print OUTFILE $PlottedImage->jpeg;
close OUTFILE;

system("ristretto temp.jpeg");

