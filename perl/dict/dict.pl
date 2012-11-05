#!/usr/bin/perl
use strict;
use warnings;

sub find_in_file {
	my ($filename, $word) = @_;
	open my $file, "<", $filename or die "Can't open definitions: $!";
	for my $line (<$file>) {
		if ($line =~ /$word/) {
			my @definition = split(/ /, $line, 2);
			print $definition[1];
		}
	}

}

find_in_file "dict.txt", @ARGV;
