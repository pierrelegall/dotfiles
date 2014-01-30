# Make this Emacs config yours

# Variables

DIRECTORIES = $(shell ls -d */)

# Actions

all: run_all_makefiles

run_all_makefiles:
	@ for each in $(DIRECTORIES) ; do \
		make -C $$each --quiet ; \
	done
