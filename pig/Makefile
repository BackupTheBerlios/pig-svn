#!/usr/bin/env sh
all:
	chmod +x ./pig
	./pig > index.php
install:
	chmod +x ./upload.pl
	./upload.pl
clean:
	rm index.* && \
	rm img/gen/* || \
	rm img/gen/*
