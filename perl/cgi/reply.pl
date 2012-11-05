#!/usr/bin/perl
use strict;
use warnings;
use CGI ':standard', '-debug';

print header();
print start_html();
for my $i (param()) {
	print "<b>", $i, "</b>: ", param($i), "<br>\n";
}

print end_html();
