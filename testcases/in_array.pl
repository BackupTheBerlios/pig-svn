#!/usr/bin/env perl

@array = ( 'foo', 'bar' );

if (grep /foo/, @array) {
	print "yes";
}
print $#array;
