#!/usr/bin/env perl
#
# PIG - Perl Imagegallery Generator
#
# Copyright (C) 2004: Ævar Arnfjörð Bjarmason
# Ævar Arnfjörð Bjarmason <avar@users.berlios.de>, 2004
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
package css;

my @file	= ( 'bxs_d.css','bxs_l.css',	);
my @text	= ( '#b09032',	'#600',		);
my @text_em	= ( '#d0b254',	"$text[1]",	);
my @text_hover	= ( '#b09032',	'#fff',		);
my @fg		= ( '#5F5944',	'#69c',		);
my @bg		= ( '#4b4633',	'#903',		);
my @bg_hover	= ( '#333',	'#444',		);
my @bc		= ( '#000',	'#303',		);
my @bb		= ( '1px',	'5px',		);
my @sb		= ( '1px',	'2.5px',	);
my @img_fg	= ( '#333',	'#fff',		);
my @img_fg_hover= ( "$fg[0]",	"$fg[1]",	);

#foreach my $i (0,$#bg) { # <- Perl Syntax
for ( my $i='0'; $i<$#bg + 1; $i++ ) { # <- C Syntax
open( OUTF, ">$file[$i]" ) or die("Can't open '$file[$i]' for writing: $!");
print OUTF <<CSS;
html, body {
	margin: 0;
	padding: 0;
	background-color: $bg[$i];
}

h1, h2, h3, h4, h5, h6 {
	margin: 0;
	text-align: center;
	margin-left: 0.5em;
	margin-right: 0.5em;
}

h1 {
	letter-spacing: 10px;
	margin-bottom: 0;
	padding: 10px;
	
	border-left: $bb[$i] solid $bc[$i];
	border-right: $bb[$i] solid $bc[$i];
	border-bottom: $bb[$i] solid $bc[$i];
	background-color: $fg[$i];
	color: $text[$i];
}

address {
	text-align: center;
	letter-spacing: 1px;
	margin-left: 1em;
	margin-right: 1em;
	margin-bottom: 0;
	padding: 10px;
	border-top: $bb[$i] solid $bc[$i];
	border-left: $bb[$i] solid $bc[$i];
	border-right: $bb[$i] solid $bc[$i];
	background-color: $fg[$i];
	color: $text[$i];
}

h2 {
	color: $text[$i];
}

h6 {
	font-size: 150%;
	margin-left: 2em; margin-right: 2em;
	margin-top: 5px;
	margin-bottom: 5px;
	padding: 5px;
	border: $bb[$i] solid $bc[$i];
	background-color: $bg[$i];
	color: $text[$i];
}

h1 span {
	padding: 0px;
	margin: 0px;
	letter-spacing: 2px;
	font-size: 120%;
	font-weight: bold;
	padding-left: 5px;
	padding-right: 5px;
	background-color: $bg[$i];
	border: $sb[$i] solid $bc[$i];
}

h1 span:hover {
	padding: 2.5px; /* Half the way through the border */
	letter-spacing: 4px;
	font-size: 120%;
	font-weight: bold;
	color: $text_hover[$i];
	background-color: $bg_hover[$i];
	/*display: block;*/
	border: $bb[$i] solid $bc[$i];
}

h1 em, h2 em, h3 em, h4 em, h5 em, h6 em, address em {
	color: $text_em[$i];
	font-style: normal;
	font-size: 120%;
}

h1 span em:hover, h2 em:hover, h3 em:hover, h4 em:hover, h5 em:hover, h6 em:hover, address em:hover {
	text-decoration: underline;
}

ul {
	text-color: $text[$i];
	text-align: left;
	list-style-type: square;
}

.Content {
	margin-left: 1em;
	margin-right: 1em;
	margin-bottom: 0;
	border: $bb[$i] solid $bc[$i];
	
	text-align: center;
	color: #000;
	margin-top: 5px;
	padding: 15px;
	background-color: $fg[$i];
	margin-bottom: 5px;
}

a:link {color: $text[$i];}
a:hover, a:hover:visited {
	color: $text_hover[$i];
	background-color: transparent;
	text-decoration: underline;
}
a:active {background-color: transparent;}
a:visited {
	color: $bg_hover[$i];
	text-decoration: none;
}

img, img:hover {
	vertical-align: top;
	margin-left: 1em;
	margin-right: 1em;
	margin-bottom: 1em;
}

img {
	background-color: $img_fg[$i];
	padding: 1em;
	border: $bb[$i] solid $bc[$i];
}

img:hover {
	background-color: $img_fg_hover[$i];
}

img:focus, img:active {
	background-color: $bg[$i];
}
CSS
close(OUTF);
}
