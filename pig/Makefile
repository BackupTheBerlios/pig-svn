#!/usr/bin/env sh
all:
	@chmod +x ./pig
	./pig > index.php
install:
	@chmod +x ./upload
	./upload
clean:
	rm index.* && \
	rm img/gen/* || \
	rm img/gen/*
distclean:
	@echo Reverted back to distribution state.
	rm index.* && \
	rm config.pl || \
	rm config.pl && \
	rm img/gen/* || \
	rm img/gen/* && \
	rm img/src/* || \
	rm img/src/*
help:
	@echo Help on using this makefile:
	@echo
	@echo all:		runs ./pig
	@echo install:	runs ./upload
	@echo clean:	removes all generated files
	@echo distclean:	removes all generated files and all user inserted files.
