all: print-info setup

print-info:
	@ echo "[npm]"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR)/npmrc $(HOME)/.npmrc
