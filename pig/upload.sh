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

# Keep the config here while these shellscripts are being phased-out
if [ "$(hostname -s)" = "Rancorwe" ]; then
	# Upload
	ftp_user="boaesd"
	#ftp_user="jeedo"
	ftp_host="heim.simnet.is"
	#ftp_host="atvinnu.gella.is"
	ftp_port="21"
	#ftp_port="6000"
	ftp_remote_dir="/album"
	#ftp_remote_dir="" # root
elif [ "$(hostname -s)" = "Aria" ]; then
	ftp_user="mynd"
	ftp_host="muninn.is"
	ftp_port="21"
	ftp_remote_dir="/mynd/ari"
fi

# Just how the fuck did i once accomplish the same by using an argument on read ?
stty -echo
read -p "Pass: " ftp_pass
stty echo

ncftpput -u $ftp_user -p $ftp_pass -P $ftp_port $ftp_host $ftp_remote_dir/ index.*
ncftpput -u $ftp_user -p $ftp_pass -P $ftp_port $ftp_host $ftp_remote_dir/ Makefile
ncftpput -R -u $ftp_user -p $ftp_pass -P $ftp_port $ftp_host $ftp_remote_dir/style/ style/css.php
ncftpput -R -u $ftp_user -p $ftp_pass -P $ftp_port $ftp_host $ftp_remote_dir/bin/ bin/*


# This is an implementation of rsync over FTP, in shellscript. its ugly, but works
ncftpls -u $ftp_user -p $ftp_pass -P $ftp_port ftp://${ftp_host}${ftp_remote_dir}/img/gen/|sort -n > ~/.on_server
cd img/gen/ &>/dev/null
find .|sed s/^..//|grep -vE "(^$|^\.)"|grep -iE "(jpg$|jpeg$|jpe$|png$|gif$)"|sort -n > ~/.on_local
for i in $(diff -u ~/.on_server ~/.on_local |grep -iE "(jpg$|jpeg$|jpe$|png$|gif$)"|grep ^+|sed s/^+//|sort -r); do
	ncftpput -u $ftp_user -p $ftp_pass -P $ftp_port $ftp_host $ftp_remote_dir/img/gen/ $i;
done
cd ../../
rm ~/.on_server ~/.on_local
