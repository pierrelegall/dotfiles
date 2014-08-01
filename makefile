# Variables

DIRECTORIES = $(shell ls -d */)

# Actions

all: make_all

get_info:
	@ echo "This makefile run all sub directory makefiles"

make_all: get_info
	@ echo ""
	@ for each in $(DIRECTORIES); do \
		make -C $$each --quiet; \
		echo ""; \
	done
