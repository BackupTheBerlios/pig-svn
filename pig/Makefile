#!/usr/bin/env sh
all:
	chmod +x bin/pig
	./bin/pig > index.php
install:
	bash bin/upload.sh
clean:
	rm index.* && \
	rm img/gen/* || \
	rm img/gen/*
