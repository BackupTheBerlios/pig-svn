<?php
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

header('Content-Type: text/css; charset=UTF-8');

// function ripped from http://php.net/dechex
function rand_color() {
	$hexcolor = dechex(mt_rand(0,16777215));
  
	while (strlen($hexcolor) < 6) {
		$hexcolor = $hexcolor."0";
	}
	return $hexcolor;
}

if ( empty($_GET['scheme']) || $_GET['scheme'] == ('Dark') ) {
	$text='#b09032'; // #600
	$text_em='#D0B254';
	$text_hover='#b09032'; // #fff
	$fg='#5F5944;'; // #69c
	$bg='#4b4633'; // #903
	$bg_hover='#333'; // #444
	// bordercolor
	$bc='#000'; // #303
	// big-border
	$bb='1px'; // 5px
	// small-border
	$sb='1px'; // 2.5px

	$img_fg='#333'; // #fff
	$img_fg_hover=$fg; // $fg

} elseif ( $_GET['scheme'] == ('Light') ) {
	$text='#600';
	$text_em=$text;
	$text_hover='#fff'; // #fff
	$fg='#69c;'; // #69c
	$bg='#903'; // #903
	$bg_hover='#444'; // #444
	$bc='#303'; // #303
	$bb='5px'; // 5px
	$sb='2.5px'; // 2.5px
	
	$img_fg='#fff'; // #fff
  $img_fg_hover=$fg; // $fg
} elseif ( $_GET['scheme'] == ('Random') ) {
	$text="#".rand_color();
	$text_em="#".rand_color();
	$text_hover="#".rand_color();
	$fg="#".rand_color();
	$bg="#".rand_color();
	$bg_hover="#".rand_color();
	$bc="#".rand_color();
	$bb="#".rand_color();
	$sb="#".rand_color();

	$img_fg="#".rand_color();
	$img_fg_hover="#".rand_color();
}

echo "
html, body {
	margin: 0;
	padding: 0;
	background-color: $bg;
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
	
	border-left: $bb solid $bc;
	border-right: $bb solid $bc;
	border-bottom: $bb solid $bc;
	background-color: $fg;
	color: $text;
}

address {
	text-align: center;
	letter-spacing: 1px;
	margin-left: 1em;
	margin-right: 1em;
	margin-bottom: 0;
	padding: 10px;
	border-top: $bb solid $bc;
	border-left: $bb solid $bc;
	border-right: $bb solid $bc;
	background-color: $fg;
	color: $text;
}

h2 {
	color: $text;
}

h6 {
	font-size: 150%;
	margin-left: 2em; margin-right: 2em;
	margin-top: 5px;
	margin-bottom: 5px;
	padding: 5px;
  border: $bb solid $bc;
  background-color: $bg;
	color: $text;
}

h1 span {
	padding: 0px;
	margin: 0px;
	letter-spacing: 2px;
	font-size: 120%;
	font-weight: bold;
	padding-left: 5px;
	padding-right: 5px;
	background-color: $bg;
	border: $sb solid $bc;
}

h1 span:hover {
	padding: 2.5px; /* Half the way through the border */
	letter-spacing: 4px;
	font-size: 120%;
	font-weight: bold;
	color: $text_hover;
	background-color: $bg_hover;
	/*display: block;*/
	border: $bb solid $bc;
}

h1 em, h2 em, h3 em, h4 em, h5 em, h6 em, address em {
	color: $text_em;
	font-style: normal;
	font-size: 120%;
}

h1 span em:hover, h2 em:hover, h3 em:hover, h4 em:hover, h5 em:hover, h6 em:hover, address em:hover {
	text-decoration: underline;
}

ul {
	text-color: $text;
	text-align: left;
	list-style-type: square;
}

.Content {
	margin-left: 1em;
	margin-right: 1em;
	margin-bottom: 0;
	border: $bb solid $bc;
	
	text-align: center;
	color: #000;
	margin-top: 5px;
	padding: 15px;
	background-color: $fg;
	margin-bottom: 5px;
}

a:link {color: $text;}
a:hover, a:hover:visited {
	color: $text_hover;
	background-color: transparent;
	text-decoration: underline;
}
a:active {background-color: transparent;}
a:visited {
	color: $bg_hover;
	text-decoration: none;
}

img, img:hover {
	vertical-align: top;
	margin-left: 1em;
	margin-right: 1em;
	margin-bottom: 1em;
}

img {
	background-color: $img_fg;
	padding: 1em;
	border: $bb solid $bc;
}

img:hover {
	background-color: $img_fg_hover; /* 903 */
}

img:focus, img:active {
	background-color: $bg; /* 69c */
}";
