#!/usr/bin/perl
use Gtk2 -init;
use strict;

my $quit = sub { exit };

my $window = Gtk2::Window->new;
$window->signal_connect('delete_event', $quit);
$window->set_position('center');
$window->set_border_width(8);
$window->set_title('Hello World!');
$window->set_default_size(200, 100);

my $label = Gtk2::Label->new('Hello World!');

my $button = Gtk2::Button->new_from_stock('gtk-quit');
$button->signal_connect('clicked', $quit);

my $vbox = Gtk2::VBox->new;
$vbox->set_spacing(8);

$vbox->pack_start($label,  1, 1, 0);
$vbox->pack_start($button, 0, 0, 0);

$window->add($vbox);

$window->show_all;

Gtk2->main;
