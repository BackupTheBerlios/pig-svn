#!/usr/bin/env bash
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

function get_ver() {
	svn log .|grep ^r| awk '{print $1}'|sed s/^r//
}

function version() {
	echo "$(get_ver | head -n1)-$(get_ver | tail -n1)" | bc -l | tr -d '\n'
}

svn up

tar -czf PIG-$(version).tar.gz \
	--exclude='.svn' \
	--exclude="doc/test" \
	*
