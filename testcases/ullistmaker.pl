#!/usr/bin/env perl
# Author: Ævar Arnfjörð Bjarmason
# Licence: GPL2 and later versions of the GPL

use strict;
use warnings;

# Set the initial values for variables
my $level	= '0';
my @tree	= ();
my @dir		= ();
my $first_run	= '1';
my $last_run 	= '0';

sub gen_dir {
	opendir(DIR, '.') || die "\tCannot opendir() '.' ($!)";
	@dir = sort readdir(DIR);
	# grep out all .* and none-directory files
	@dir = grep { !/^\./ && -d "$_" } @dir;
	closedir(DIR);
}

sub gen_html {
	# On first run open the unordered list.
	if ($first_run) {
		$tree[$level] = '0';
		if ($#dir ne -1) { # If the array is not empty
			print "<ul>\n";
			$first_run--;
		}
	}

	if ($last_run) {

	}
}

# Checks if we should break the loop
sub checker {
	if ( $level eq '0') {
		
	}
	$stop++;
}

# Do this until $#dir in $level '0' > $#dir;
do {
	&gen_dir;
	&gen_html;
} until ($stop)

#for (@dir) {
#	print "\t"x($level+1) . "<li>$_</li>\n";
#}
