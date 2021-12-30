all: print-info setup

print-info:
	@ echo "[git]"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR)/gitconfig $(HOME)/.gitconfig
