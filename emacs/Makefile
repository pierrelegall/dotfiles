disabled:

all: print-info setup

print-info:
	@ echo "[emacs]"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CONFIG_DIR)/init.el $(HOME)/.emacs
