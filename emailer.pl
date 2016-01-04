#!/usr/bin/perl -w
use Email::MIME;
use Email::Sender::Simple("sendmail");

my $Mail = Email::MIME->create(
header_str => [
	From => "quadPC\@box",
	To => "mbhmanning\@gmail.com",
	Subject => "automatic e-mail",],
	
attributes =>{
	encoding => 'quoted-printable',
	charset => 'ISO-8859-1',},
	
body_str => "It worked.\n\nSigning off\n--127.0",
);

sendmail($Mail);
