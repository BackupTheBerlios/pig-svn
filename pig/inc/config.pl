#!/usr/bin/env perl
#
# PIG - Perl Imagegallery Generator
#
# Copyright (C) 2004: Ævar Arnfjörð Bjarmason
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

package conf;

my $hostname = `hostname -s`; chomp $hostname;

$root	 		= `pwd`; chomp $root;
$img_src 		= 'img/src';
$img_gen		= 'img/gen';
# Test: using 16 images -geometry took 2m:15si and -scale took 1m:21s
$convert_args_thumb	= '-quality 50 -scale 300x300 -sharpen 1';
$convert_args_big	= '-quality 60 -scale 800x800';

# Config for Ævar Arnfjörð Bjarmason
if ( $hostname eq "Rancorwe" ) {
	$title		= "Ævar Arnfjörð Bjarmason";
	$h1		= "<span><em>Æ</em>var <em>A</em>rnfjörð <em>B</em>jarmason</span>";
	$h2		= "<em>M</em>yndaanállinn <q><em>P</em>iltungs <em>F</em>egurðareigindar <em>V</em>ífu</q>";
	$address	= '
	<small>
		Permission is granted to copy, distribute and/or modify this document
		under the terms of the <a href="http://www.gnu.org/copyleft/fdl.html">
		GNU Free Documentation License</a>, Version 1.2 or any later version 
		published by the <a href="http://www.fsf.org/">Free Software Foundation</a>;
		with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
	</small>
';
	
	# Upload
	$ftp_user	= "boaesd";
	$ftp_host	= "heim.simnet.is";
	$ftp_port	= "21";
	$ftp_remote_dir	= "/album";

	# Other
	$css_prefix	= ""; # http://est.is/~munk14/
	$dynamic	= 'PHP'; # php, asp

# Config for Ari Marteinsson
} elsif ( $hostname eq "Aria" ) {
	$title		= "Ari Marteinsson";
	$h1		= "<span><em>A</em>ri <em>M</em>arteinsson</span>";
	$h2		= "";
	$address	= "";

	# Upload
	$ftp_user	= "mynd";
	$ftp_host	= "muninn.is";
	$ftp_port	= "21";
	$ftp_remote_dir	= "/mynd/ari";

	# Other
	$css_prefix	= "";
	$dynamic	= "asp"; # php, asp
# Other people can use this
} else {
	$title		= "";
	$h1		= "";
	$h2		= "";
	$address	= "";

	# Upload
	$ftp_user	= "";
	$ftp_host	= "";
	$ftp_port	= "";
	$ftp_remote_dir = "";

	# Other
	$css_prefix	= "";
	$dynamic	= "";
}


return 1;
