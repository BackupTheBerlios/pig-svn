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
use Net::FTP;

package upload;
require 'config.pl';

# perldoc perlmodlib
if (${conf::ftp_password} eq "" || !defined ${conf::ftp_password} ) {
	print "Password: ";
	${conf::ftp_password} = <STDIN>; chop ${conf::ftp_password};
}

my $ftp = Net::FTP->new("heim.simnet.is", Debug => 0);
$ftp->login("${conf::ftp_user}","${conf::ftp_password}",'PIG@Pig.BerliOS.de');
$ftp->cwd("/");
$ftp->get("PIG.png");
$ftp->quit; 
