#!/usr/bin/env sh
all:
	@chmod +x ./css.pl
	./css.pl
	@chmod +x ./pig
	./pig > index.php
clean:
	rm index.* && rm bxs_*.css && rm img/gen/* || \
	rm img/gen/* && rm bxs_*.css || rm bxs_*.css
distclean:
	@echo Reverting back to distribution state.
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
upload:
	@chmod +x ./upload
	./upload
