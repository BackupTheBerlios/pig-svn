#!/usr/bin/env perl
use strict;
my $b = '2'; # 0 = don't break at all

# This is a testcase for the 'break every X items feature'
# For this to work properly we have to start counting at '1
for ( my $i=1; $i<10 ; $i++ )  {
	print "$i\n";
	unless ( $b == 0 ) {
		if ($i % $b == 0) { # Note: Would be ( $i % 2 == 0 ) if the count had started at '1'
			print "<br style=\"clear: both;\">\n";
		}
	}
}
