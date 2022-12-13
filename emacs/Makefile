all: print-info setup

print-info:
	@ echo "[emacs]"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR)/init.el $(HOME)/.emacs
