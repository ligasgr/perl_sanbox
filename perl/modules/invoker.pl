#!/usr/bin/perl
use MyConfig;

my $conf = new MyConfig;
$conf->read('config.conf') or die "Couldn't read config file: $!";
$conf->set('author.country', 'Canada');
print "The author's first name is ", $conf->get('author.firstname'), ".\n";
print "and he lives in ", $conf->get('author.country'), "\n";
$conf->write("output.conf");
