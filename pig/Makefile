#!/usr/bin/env sh
all:
	@chmod +x ./css.pl
	./css.pl
	@chmod +x ./pig
	./pig > index.php
clean:
	- rm index.* 
	- rm bxs_*.css 
	- rm img/gen/*
distclean: clean
	@echo Reverting back to distribution state.
	- rm config.pl
	- img/gen/*
help:
	@echo Help on using this makefile:
	@echo
	@echo all:		runs ./pig
	@echo install:		runs ./upload
	@echo clean:		removes all generated files
	@echo distclean:	removes all generated files and all user inserted files.
upload:
	@chmod +x ./upload
	./upload
