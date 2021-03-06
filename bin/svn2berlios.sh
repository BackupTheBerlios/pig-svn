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

TMP="/tmp/pig"
HTDOCS="/home/groups/pig/htdocs"
RSYNC_OPT="-r --delete --delete-after -v"

# First clean out the temp directory
rm -rf "${TMP}"
mkdir -p "${TMP}"

# These are used for the package part,
function get_ver() {
	svn log "${TMP}"|grep ^r| awk '{print $1}'|sed s/^r//
}

function version() {
  echo "$(get_ver | head -n1)-$(get_ver | tail -n1)" | bc -l | tr -d '\n'
}

function fix_perms() {
	# Set proper permissions on it so that noone corrupts it while we're working 
	# on it.
	chown -R $(whoami):$(whoami) "${TMP}"
	chmod -R 755 "${TMP}"
}

fix_perms
# Checking out the repository and rsyncing proper files in it to the proper 
# places
svn -q co svn://svn.berlios.de/pig/ ${TMP}/ &>/dev/null ||\
svn -q co svn+ssh://svn.berlios.de/svnroot/repos/pig/ ${TMP}/
fix_perms

rsync $RSYNC_OPT --exclude=".svn" --exclude="sample/*" ${TMP}/htdocs/ $HTDOCS/

# Making sample pagess.
for i in 1 2; do
	mkdir -p ${HTDOCS}/sample/${i}
	rsync $RSYNC_OPT --exclude=".svn" \
		--exclude="img/src" \
		--exclude="img/gen" \
		--exclude="config.pl" \
		${TMP}/pig/ ${HTDOCS}/sample/$i
	
	cd ${HTDOCS}/sample/${i}/
	make
done

# Make a new package for the ftp filearea.

cd "${TMP}/pig/"
tar -czf PIG-$(version).tar.gz \
	--exclude='.svn' \
	--exclude="doc/test" \
	*

mv PIG-*.tar.* /home/groups/ftp/pub/pig/packages/
