#!/usr/bin/env sh
all:
	perl bin/make_index.pl > index.php
install:
	bash bin/upload.sh
clean:
	rm index.* && \
	rm img/gen/* || \
	rm img/gen/*
