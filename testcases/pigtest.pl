#!/usr/bin/env perl

use strict;
use warnings;

my $level	= '0';
my @tree	= ();
my @dir		= ();


print "<ul>\n";
sub gen_dir {
	opendir(DIR, '.') || die "\tCannot opendir() '.' ($!)";
	@dir = sort readdir(DIR);
	# grep out all .* and none-directory files
	@dir = grep { !/^\./ && -d "$_" } @dir;
	closedir(DIR);
}

&gen_dir;

$tree[$level] = 0;

for (@dir) {
	print "\t"x($level+1) . "<li>$_</li>\n";
}

print "</ul>\n";
