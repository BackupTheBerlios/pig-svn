#!/usr/bin/env perl
#
# PIG - Perl Imagegallery Generator
#
# Copyright (C) 2004: Ævar Arnfjörð Bjarmason
# Ævar Arnfjörð Bjarmason <jeedo@users.sourceforge.net>, 2004
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or (at
# your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

use strict;
#use warnings;
package main;

require 'inc/config.pl';

# There's more than one way to do it - Larry Wall
#if ( $conf::dynamic eq 'php' || $conf::dynamic eq 'PHP' ) {
#if ( lc($conf::dynamic) eq 'php' ) {
#if ( "\L$conf::dynamic" eq 'php' ) {
if ( $conf::dynamic =~ /php/i ) {
print <<PHP;
<?php
if ( stristr(\$_SERVER['HTTP_ACCEPT'],'application/xhtml+xml') ) {
	header('Content-type: application/xhtml+xml; charset=UTF-8');
} elseif ( stristr(\$_SERVER['HTTP_ACCEPT'],'application/xml') ) {
	header('Content-type: application/xml; charset=UTF-8');
} elseif ( stristr(\$_SERVER['HTTP_ACCEPT'],'text/xml') ) {
	header('Content-type: text/xml; charset=UTF-8');
} else {
	header('Content-type: text/html; charset=UTF-8');
}
echo ('<?xml version="1.0" encoding="UTF-8"?>'."\\n");
?>
PHP
} elsif ( $conf::dynamic =~ /asp/i ) {
	# Would add this header, however this would add to the already existing
	# Content-Type header, so if you're going to use the AddHeader function make
	# sure the header doesnt exist already 
	#<%Response.AddHeader "Content-Type","text/html; charset=UTF-8"%> 
	print '<%Response.Charset="UTF-8"%>'."\n";
	printf '<?xml version="1.0" encoding="UTF-8"?>'."\n";
} else {
	printf '<?xml version="1.0" encoding="UTF-8"?>'."\n";
}

print <<HEAD;
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<title>${conf::title}</title>
	<meta name="generator" content="PIG - Perl Imagegallery Generator, Perl $]V"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<link rel="stylesheet" type="text/css" href="${conf::css_prefix}style/css.php?scheme=Dark" title="Boxes - Dark" media="screen, projection"/>
	<link rel="alternate stylesheet" type="text/css" href="${conf::css_prefix}style/css.php?scheme=Light" title="Boxes - Light" media="screen, projection"/>
	<link rel="alternate stylesheet" type="text/css" href="${conf::css_prefix}style/css.php?scheme=Random" title="Boxes - Random" media="screen, projection"/>
</head>

<body>

<h1>${conf::h1}</h1>

<h2>${conf::h2}</h2>

<div class="Content">
HEAD

#<vorsprung> 1) get the directories in a array @directorynames=<*>
#<vorsprung> 2) loop over the array for my $dir (@directorynames) {
#<vorsprung> 3) split out the y/m/d and title my ($y,$m,$d,$t)=$dir=~/(\d+)-(\d+)-(\d+)\s(.+)/;
#<vorsprung> hmm actually no that is overcomplicated
#<vorsprung> 3) split out the date and title my ($date,$t)=$dir=~/(\d+-\d+-\d+)\s(.+)/;
#<Jeedo> i want the formet one since i need to use the year, month, days and titles seperatly later
#<vorsprung> store the dates and real dir names in a hash $dirnames{$date}=$dir;
#<vorsprung> 4) loop through the years, months and days for my $y (2003..2004) { for my $m (1..12) { for my $d (1..31) {
#<vorsprung> hmm actually no not quite like that
#<vorsprung> you know
#<Jeedo> shouldnt that be (00..12) and (00..31) since it is ISO dates?
#<vorsprung> Jeedo, i think the best way is to split into y,m,d and store y,m,d seperately in a hash
#<vorsprung> Jeedo, ie $date{$year}->{$month}->{$day}=$dirname
#<vorsprung> Jeedo, then in the loop through the years, months and days use the exist() function to look each bit up
#<vorsprung> so for my $year (2003..2005) { if (exists{$date{$year}) ) { print p($year); } else { next; } for my $mon (1..12) { if (exists($date{$year}->{$mon}

#chdir('img/gen/');
#$some_dir="img/gen/";

#@directorynames = readdir('img/gen/'); for my $dir (@directorynames) { print "$dir"; }
# 1) get the directories in a array @directorynames=<*>
# 2) loop over the array for my $dir (@directorynames) {
# <s> 3) split out the y/m/d and title my ($y,$m,$d,$t)=$dir=~/(\d+)-(\d+)-(\d+)\s(.+)/; </s>
# 3) split out the date and title my ($date,$t)=$dir=~/(\d+-\d+-\d+)\s(.+)/;
# 4) loop through the years, months and days for my $y (2003..2004) { for my $m (1..12) { for my $d (1..31) {

# (my $date, my $text) = split(/\s+/, $dir, 2);
# print "$date, $text";


# First do some cleanup:
#opendir(IMG_GEN_DIR, ${conf::img_gen});
#my @file_dir = readdir(IMG_GEN_DIR);
#closedir(IMG_GEN_DIR);
#foreach my $file (sort @file_dir) {
#	unless ( ($file eq '.') || ($file eq '..') || ($file eq '.svn')) {
#	unlink "$file";
#	}
#}

# Some subroutines

# This subroutine generates modified versions of the $dir variable, it detects
# if the $dir variable contains a ISO Date and makes appropriate modificatins 
sub gen_dir_vars {
	package dir;
	# First undefine these variables which might be filled.
	our $short = undef;
	our $underscore = undef;
	our $short_underscore = undef;

	# For dirs with ISO Dates in their names
	if ($main::dir =~ /^\d{4}-\d{2}-\d{2}/) {	
		(our $short = $main::dir) =~ s/^.{11}//; # s/^{11}//g;
	# For the others
	} else {
		(our $short = $main::dir);
	}
	(our $underscore = $main::dir) =~ s/\ /_/g;
	(our $url = $main::dir) =~ s/\ /%20/g;
	(our $short_underscore = $short) =~ s/\ /_/g;
	(our $short_url = $short) =~ s/\ /%20/g;
	# This is only needed in the short form
	(our $short_html = $short) =~ s/(\w)(\w*)/<em>\U\1\L<\/em>\E\2/g;
	# Better but unimplemented version:
	# echo "foo b ar" | perl -lne'map { @a = split( //, $_ ); print "<em>$a[0]</em>" . ( $a[1] ? "<small>$a[1]</small>": "") } split(/\s+/, $_);'

	# Example usage:
	#	&gen_dir_vars;
	#	print "$main::dir\n";
	#	print "$dir::underscore\n";
	#	print "$dir:url\n";
	#	print "$dir::short\n";
	#	print "$dir::short_underscore\n";
	#	print "$dir::short_url\n";
	#	print "$dir::$short_html\n";
	# Output:
	#	2004-04-01 This is a description
	#	2004-04-01_This_is_a_description
	#	2004-04-01%20This%20is%20a%20description
	#	This is a description
	#	This_is_a_description
	#	This%20is%20a%20description
	#	<em>T</em>his <em>i</em>s <em>a</em> <em>d</em>escription
	return 1;
}

sub gen_img_vars {
	package img;
	# First undefine these variables which might be filled.
	our $short = undef;
	our $w = undef;
	our $h = undef;

	# Generate a version of $file that has no extention
	(our $short = $main::file) =~ s/\.[^.]*$//g;
	
	# Generate width/height from $dimensions, only one call is made to
	# identify and then perl split() is used., however this makes the
	# script 6 times slower. 4s VS 24 in previous tests.
	
	# our $dimensions = `identify -ping -format "%w:%h" "${conf::root}/${conf::img_gen}/thumb.${dir::underscore}_${main::file}"`;
	# our $dimensions =~ tr/\n//d;
	# (our $w, our $h) = split(/\:/, $dimensions, 2);

	return 1;
}

# Generate the unordered list:
print "<ul>\n";
opendir(IMG_SRC_DIR, ${conf::img_src}) || die "\tCannot opendir() '${conf::img_src}'; $!";
my @img_src_dirs = readdir(IMG_SRC_DIR);
closedir(IMG_SRC_DIR);
foreach our $dir (sort @img_src_dirs) {
	&gen_dir_vars;
	unless ( ($dir eq '.') || ($dir eq '..') || ($dir eq '.svn')) {
		&gen_dir_vars;
		# (my $date, my $text) = split(/\s+/, $dir, 2);
		# print "$date, $text";
		print "\t<li><a href=\"#${dir::short_underscore}\" title=\"${dir::short}\">$dir</a></li>\n";
	}
}
print "</ul>\n";

# Open to the img/src/ directory and list it's contents
opendir(IMG_SRC_DIR, ${conf::img_src}) || die "\tCannot opendir() '${conf::img_src}'; $!";
my @img_src_dirs = readdir(IMG_SRC_DIR); 
closedir(IMG_SRC_DIR);

# Sort the contents of img/src/ and generate some variables from it
foreach our $dir (sort @img_src_dirs) {
	&gen_dir_vars;
	# Entering the img/src/*/
	unless ( ($dir eq '.') || ($dir eq '..') || ($dir eq '.svn')) {
		chdir "img/src/${dir}/" || die "\tCannot chdir() to '$dir'; $!\n";
		print "\n<h6 id=\"${dir::short_underscore}\">${dir::short_html}</h6>\n";

		# Reading files in img/src/*/
		opendir(FILE_DIR, '.');
		my @file_dir = readdir(FILE_DIR);
		closedir(FILE_DIR);
		# This should be $file not $dir but since we need to use the $dir subroutine this is the easy way
		foreach our $file (sort @file_dir) {
			&gen_dir_vars;
			unless ( ($file eq '.') || ($file eq '..') || ($file eq '.svn')) {
				&gen_img_vars;
				if (!-e "${conf::root}/${conf::img_gen}/${dir::underscore}_${file}") {
					system("convert $conf::convert_args_big \"${file}\" \"${conf::root}/${conf::img_gen}/${dir::underscore}_${file}\"");
				}
				if (!-e "${conf::root}/${conf::img_gen}/thumb.${dir::underscore}_${file}" ) {
					system("convert $conf::convert_args_thumb \"${file}\" \"${conf::root}/${conf::img_gen}/thumb.${dir::underscore}_${file}\"");
				}
				print "\t<a href=\"${conf::img_gen}/${dir::underscore}_${file}\">\n";
				print "\t\t<img src=\"${conf::img_gen}/thumb.${dir::underscore}_${file}\" alt=\"${dir::short} - ${img::short}\"/>\n";
				print "\t</a>\n";
			}
		}
		chdir "${conf::root}";
	}
}

print "</div>\n\n";
unless (${conf::address} eq "" || !defined ${conf::address} ) {
	print "<address>${conf::address}</address>\n";
	print "\n";
}
print "</body>\n";
print "</html>\n";

