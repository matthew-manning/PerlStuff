#!/usr/bin/perl -w

use Carp;

sub willCarp
{carp "warning at call location(not line ".__LINE__.")\n";}# $! not very useful to print in this case

sub willCroak
{croak "dying at call location(not line ".__LINE__.")\n";}# __LINE__ does not interpret from double quotes

sub willConfess
{confess "dying will stack backtrace: $!";}

sub callWillConfess{ willConfess; }#to show backtrace

willCarp;

#willCroak;# works but dies before this program can confess

callWillConfess;
