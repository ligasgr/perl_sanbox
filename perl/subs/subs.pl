#!/usr/bin/perl
use strict;
use warnings;

sub just_a_routine {
	my (@args) = @_;
	for my $arg (@args) {
		print $arg, "\n";
	}
}

my @array_for_sub = (1, 2, 3, 4);
just_a_routine "first arg", "2", 3, @array_for_sub;
