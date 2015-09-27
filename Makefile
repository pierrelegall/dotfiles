# Variables

SUB_DIRECTORIES = $(shell ls -d */)

# Actions

all: print-info make-all

print-info:
	@ echo "This makefile run all sub directories makefiles."

make-all:
	@ for each in $(SUB_DIRECTORIES); do \
		echo ""; \
		make -C $$each --quiet; \
	done
