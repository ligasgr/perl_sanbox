#!/usr/bin/perl
use strict;
use warnings;

open(my $in,  "<",  "input.txt")  or die "Can't open input.txt: $!";

my $first_line = <$in>;
print $first_line."\n";

my @rest_of_the_file = <$in>;
print @rest_of_the_file;
close $in or die "$in: $!";
