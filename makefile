# Make this Emacs config yours

# Variables

DIRECTORIES = $(shell ls -d */)

# Actions

all: setup_all

setup_all:
	@ echo ""
	@ for each in $(DIRECTORIES) ; do \
		make -C $$each --quiet ; \
		echo "" ; \
	done
