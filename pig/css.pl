#!/usr/bin/env perl
@text =		( '#b09032','#600', );
@text_em = 	('#d0b254',"$text[1]",);
@text_hover = 	('#b09032','#fff',);
@fg = 		('#5F5944','#69c',);
@bg = 		('#4b4633','#903',);
@bg_hover = 	('#333','#444',);
@bc = 		('#000','#303',);
@bb =		('1px','5px',);
@sb =		('1px','2.5px',);
@img_fg = 	('#333','#fff',);
@img_fg_hover =	("$fg[0]","$fg[1]",);

for ( $i=0; $i<$#bg + 1; $i++ ) {
print <<CSS;
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
}
