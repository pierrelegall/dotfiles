all: print-info setup

print-info:
	@ echo "[git]"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR)/gitconfig $(HOME)/.gitconfig
	@ ln -v -i -s -T $(CURDIR)/gitignore-global $(HOME)/.gitignore-global
