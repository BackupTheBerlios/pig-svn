#!/usr/bin/env sh
all:
	perl bin/make_index.pl > index.php
install:
	bash bin/upload.sh
package: 
	bash bin/make_package.sh
clean:
	rm index.* && \
	rm img/gen/* && \
	rm PIG-*.tar.gz || \
	rm img/gen/* || \
	rm PIG-*tar.gz
