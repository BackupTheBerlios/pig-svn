#!/usr/bin/env perl
# Author: Ævar Arnfjörð Bjarmason
# Licence: GPL2 and later versions of the GPL

#use strict;
use warnings;

# Set the initial values for variables
my $level	= '0';
my @tree	= ();
$tree[$level]	= '0';
my @dir	= ();
my $break	= '0';

do {
	# Make a list of the current directory.
	opendir(DIR, '.') || die "\tCannot opendir() '.' ($!)";
	@dir = sort readdir(DIR);
	# grep out all .* and none-directory files
	@dir = grep { !/^\./ && -d "$_" } @dir;
	closedir(DIR);

	# Is @dir empty?
	if ($#dir == -1) { # Y
		if ($level == 0) {
			# Nothing to do
			$break++;
		} else { #N
			print "</li>";
			chdir ('../');
			$level--;
			$tree[$level]++;
		}
	# Does $tree[$level] equal $#dir ?
	} elsif ($#dir != $tree[$level]) { # Y
		print "</li>";
		print "</ul>";
		chdir ('../');
		$level--;
		$tree[$level]++;
		# Is $level = 0
		if ($level == 0) { # Y
			print "</ul>";
			$break++;
		} else { # N
			print "</li>";
		}
	} else {
		print "<ul>";
		print "<li>";
		print $dir[$tree[$level]];
		chdir $dir[$tree[$level]++];
		$level++;
		$tree[$level] = '-1';
	}
	# On first run open the unordered list.
#	if ($first_run) {
#		$tree[$level] = '0';
#		if ($#dir ne -1) { # If the array is not empty
#			print "<ul>\n";
#			$first_run--;
#		}
#	}

} until ($break)


#for (@dir) {
#	print "\t"x($level+1) . "<li>$_</li>\n";
#}
