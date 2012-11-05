#!/usr/bin/perl
use strict;
use warnings;

open(my $log, ">>", "logfile.log") or die "Unable to open log file: $!";
print $log "Some entries";
