#!/usr/bin/perl -w
use Tk;

my $TextBox = new MainWindow;
$TextBox->messageBox(-message=>"this is text");

$TextBox->messageBox(-message=>"a rose by\nany other name\nwould smell as\nsweet.");
