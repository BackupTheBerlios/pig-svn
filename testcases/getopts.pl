#!/usr/bin/env perl

use strict;
use Getopt::Long;

$Getopt::Long::ignorecase = 0;

my $tag = '';
#my $verbose = '';
GetOptions (
#	'verbose' => \$verbose,
	'tag=s' => \$tag,
);
#print "$verbose\n";
print "$tag\n";
