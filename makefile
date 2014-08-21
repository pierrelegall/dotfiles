# Variables

DIRECTORIES = $(shell ls -d */)

# Actions

all: make_all

get_info:
	@ echo ""
	@ echo "# This makefile run all sub directory makefiles."
	@ echo "#"
	@ echo "# It should never ask for root privileges ;"
	@ echo "# however if it need them, it should ask you to run commands manualy."

make_all: get_info
	@ echo ""
	@ for each in $(DIRECTORIES); do \
		make -C $$each --quiet; \
		echo ""; \
	done
