#!/usr/bin/perl
use strict;
use warnings;
use DBI;

my $dbh = DBI->connect("dbi:mysql:phonebill", $ARGV[0], $ARGV[1]);
my $sth = $dbh->prepare(<<SQL);
	select recipient, calldate, calltime, duration
	from `call`
	where duration > 60
	order by duration desc
SQL

$sth->execute;

my %calls;
while (my @row = $sth->fetchrow_array()) {
	my ($recipient, $calldate, $calltime, $duration) = @row;
	$calls{$recipient} += $duration;
	print "Called $recipient on $calldate\n";
}

$dbh->do("delete from `call` where duration < 5"); 
