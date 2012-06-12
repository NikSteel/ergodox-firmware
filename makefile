# -----------------------------------------------------------------------------
# makefile for the ergoDOX project
#
# This should produce a single file (probably in an archive format) for
# distribution, containing everything people will need to use the software.
#
# AVAILABILITY:  This is unabashedly dependant on various Unix commands, and
# therefore probably won't work in a Windows environment.  I'm sorry.  I don't
# know a good portable way to write it.
#
# TODO:
# - include doc files (and maybe render them in html)
# - include the UI stuff (once it's done)
# -----------------------------------------------------------------------------
# Copyright (c) 2012 Ben Blazak <benblazak.dev@gmail.com>
# Released under The MIT License (MIT) (see "license.md")
# Project located at <https://github.com/benblazak/ergodox-firmware>
# -----------------------------------------------------------------------------


# the base name of the file or package to distribute
NAME := ergodox-firmware
# the branch of the git repo we're currently on
BRANCH := $(shell git branch -l | grep '*' | cut -c 3-)
# a version identifier
VERSION := $(shell date +'%Y%m%d_%H%M%S')

# name to use for the final distribution file or package
TARGET = $(NAME)--$(BRANCH)--$(VERSION)

# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------

.PHONY: all clean dist

all: dist

clean:
	git clean -dX  # remove ignored files and directories

dist: src contrib/UI

# -----------------------------------------------------------------------------

.PHONY: src contrib/UI

src:
	cd src; $(MAKE) all
	zip '$(TARGET)' src/*.hex src/*.elf src/*.map

contrib/UI:
	# nothing yet

