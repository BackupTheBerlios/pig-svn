#!/usr/bin/env perl

use strict;
use Getopt::Long;
# Bundling decides whether or not to generate short options from the long ones
Getopt::Long::Configure qw(no_bundling no_ignore_case gnu_compat no_require_order);


my $times	= undef;
my $text	= undef;
my $verbose	= undef;
#my $verbose = '';
GetOptions (
	'times=i'	=> \$times,
	'text=s' 	=> \$text,
	'verbose' 	=> \$verbose
);

for ( my $i='0' ; $i<$times; $i++ ) {
	print "$text\n";
	if ($verbose) {
		print STDERR "exiting the loop\n";
	}
}

# $ ./getopts.pl --times=2 --text loop --verbose
