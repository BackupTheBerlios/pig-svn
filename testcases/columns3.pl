#!/usr/bin/env perl
#use strict;
#my $b = '2'; # 0 = don't break at all

# This is a testcase for the 'break every X items feature'
# For this to work properly we have to start counting at '1
#for ( my $i=1; $i<10 ; $i++ )  {
#	print "$i\n";
#	unless ( $b == 0 ) {
#		if ($i % $b == 0) { # Note: Would be ( $i % 2 == 0 ) if the count had started at '1'
#			print "<br style=\"clear: both;\">\n";
#		}
#	}
#!/usr/bin/env perl
use strict;
my $col = '2'; # 0 = don't break at all

#my @array = ( 'foo', 'bar', 'zar', 'car', 'nar','flar' );
opendir(FILE_DIR, '.');
#my @file_dir = readdir (FILE_DIR);
my @file_dir = sort grep(( /\.png$/i || /\.gif$/i || /\.jp(eg|g)$/i ), readdir FILE_DIR);
closedir(FILE_DIR);
#@file_dir = sort(@file_dir);

print "Number of items in array: $#file_dir\n\n";
# This is a testcase for the 'break every X items feature'
# For this to work properly we have to start counting at '1
#for ( my $i=1; $i<10 ; $i++ )  {
for ( my $i=0; $i <= ($#file_dir); $i++ ) {
	print $file_dir[$i] . "\n"; 
	unless ( $col == 0 ) {
		if ($i % $col == 1) { # Note: Would be ( $i % 2 == 0 ) if the count had started at '1'
			print "<br style=\"clear: both;\">\n";
		}
	}
}

#my $col = '2';
#
#opendir(FILE_DIR, '.');
#my @file_dir = readdir (FILE_DIR);
#closedir(FILE_DIR);

#print "$#file_dir\n";
#
#foreach our $file (sort @file_dir) {
#	unless ( ($file eq '.') || ($file eq '..') ) {
#		for ( my $i='1'; $i<${#file_dir}; $i++ )  {
#			print "\t$file\n";
#			unless ( $col == 0 ) {
#				if ($i % $col == 0) { # Note: Would be ( $i % 2 == 0 ) if the count had started at '1'
#					print "\t<br style=\"clear: both;\">\n";
#				}
#			}
#		}
#	}
#}

