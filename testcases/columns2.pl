#!/usr/bin/evn perl
use strict;

my $col = '2';

opendir(FILE_DIR, '.');
my @file_dir = readdir (FILE_DIR);
closedir(FILE_DIR);

print "$#file_dir\n";

foreach our $file (sort @file_dir) {
	unless ( ($file eq '.') || ($file eq '..') ) {
		for ( my $i='1'; $i<${#file_dir}; $i++ )  {
			print "\t$file\n";
			unless ( $col == 0 ) {
				if ($i % $col == 0) { # Note: Would be ( $i % 2 == 0 ) if the count had started at '1'
					print "\t<br style=\"clear: both;\">\n";
				}
			}
		}
	}
}

