#!/usr/bin/env bash

rm -rf "${TMP}"
TMP="/tmp/pig"
RSYNC_OPT="-r --delete --delete-after"

if [ ! -d "${TMP}" ]; then
  mkdir -p "${TMP}"
fi

chown -R $(whoami):$(whoami) "${TMP}"
chmod -R 755 "${TMP}"

svn -q co svn://svn.berlios.de/pig/ ${TMP}/

rsync $RSYNC_OPT --exclude=".svn" --exclude="cgi-bin/" ${TMP}/htdocs/ /home/groups/pig/htdocs/
rsync $RSYNC_OPT --exclude=".svn" ${TMP}/htdocs/cgi-bin/ /home/groups/pig/cgi-bin/

cd "${TMP}"
chmod +x bin/make_package.sh
./bin/make_package.sh
if [ ! -d "/home/groups/ftp/pub/pig/packages" ]; then
	mkdir -p "/home/groups/ftp/pub/pig/packages"
fi

mv PIG-*.tar.* /home/groups/ftp/pub/pig/packages/

rm -rf "${TMP}"
