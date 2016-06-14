#!/usr/bin/perl -w

use Glib qw(TRUE FALSE);
use Gtk2 -init;

sub hello
{
	my $Widget = shift;
	my $Window = shift;
	
	print "hello funtion ran\n";
	
	$Window->destroy;
}

sub customDelete
{
	print "Custom delete event occured\n";
	return TRUE;
}

my $NewWindow = Gtk2::Window->new('toplevel');

$NewWindow->signal_connect(delete_event, /&customDelete);
										   

$NewWindow->set_border_width(5);

$NewButton =Gtk2::Button->new("click me!");

$NewWindow->add($NewButton);

$NewButton->show;

$NewWindow->show;

Gtk2->main;

return 0;
