#!/usr/bin/env perl
# Author: Ævar Arnfjörð Bjarmason
# Licence: GPL2 and later versions of the GPL

use strict;
use warnings;
use Cwd;

# Set the initial values for variables
my $level	= '0';
my @tree	= ();
$tree[$level]	= '-1';
my @dir	= ();
my $break	= '0';
my $debug 	= $ARGV[0];

sub debug_dir {
	print "DEBUG: directory is now: '" . getcwd . "' \n" if ($debug);
}

do {
	&debug_dir;
	print "DEBUG: Beginning opendir(),readdir(),closedir()\n" if ($debug); 
	# Make a list of the current directory.
	opendir(DIR, '.') || die "\tCannot opendir() '.' ($!)";
	@dir = sort readdir(DIR);
	# grep out all .* and none-directory files
	@dir = grep { !/^\./ && -d "$_" } @dir;
	closedir(DIR);
	print "DEBUG: \$#dir: '$#dir'\n" if ($debug);
	print "DEBUG: print \"\@dir\": '".@dir."'\n" if ($debug);
	for (@dir) {print "DEBUG: \@dir contents: '$_,'" if ($debug);}
	print "DEBUG: Ending opendir(),readdir(),closedir()\n\n" if ($debug);

	# Is @dir empty?
	print "DEBUG: Begining if (\$#dir == 1) {...\n" if ($debug);
	if ($#dir == -1) { # Y
		if ($level == 0) {
			print "DEBUG: \$break was == 0 '$break', setting \$break++\n" if ($debug);
			$break++;
			print "DEBUG: \$break is now 1; '$break'\n" if ($debug);
		} else { #N
			&debug_dir;
			chdir ('../');
			&debug_dir;
			print "DEBUG: Decreasing \$level ($level)\n" if ($debug);
			$level--;
			print "DEBUG: Decreased \$level ($level)\n" if ($debug);
			print "DEBUG: Increasing \$tree[\$level] ($tree[$level])\n" if ($debug);
			$tree[$level]++;
			print "DEBUG: Increased \$tree[\$level] ($tree[$level])\n" if ($debug);
		}
	#}
	# Does $tree[$level] equal $#dir ?
	} elsif ($#dir == $tree[$level]) { # Y
		if ($level == 0) {
			print "</ul>\n";
			$break++;
		} else {
			print "</li>\n";
			print "</ul>\n";
			chdir ('../');
			$level--;
			$tree[$level]++;
		}
	} 
	# Havent finished going through everything in the current directory
	elsif ($#dir != $tree[$level]) {
		print "<ul>\n";
		print "<li>";
		print $dir[$tree[$level]];
		chdir $dir[$tree[$level]++];
		$level++;
		$tree[$level] = '-1';
	}
	print "\n\n";
} until ($break)


#for (@dir) {
#	print "\t"x($level+1) . "<li>$_</li>\n";
#}
