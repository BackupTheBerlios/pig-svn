#!/usr/bin/env sh
all:
	chmod +x ./pig
	./pig > index.php
install:
	chmod +x ./upload.sh
	./upload.sh
clean:
	rm index.* && \
	rm img/gen/* || \
	rm img/gen/*
