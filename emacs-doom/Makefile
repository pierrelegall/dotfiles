CONFIG_NAME = Emacs: Doom
CONFIG_DIR = $(HOME)/.doom.d

all: print-info setup

print-info:
	@ echo "[$(CONFIG_NAME)]"

setup: set-symlinks

set-symlinks:
	@ mkdir -p $(CONFIG_DIR)
	@ ln -v -i -s -T $(CURDIR)/config.el $(CONFIG_DIR)/config.el
	@ ln -v -i -s -T $(CURDIR)/custom.el $(CONFIG_DIR)/custom.el
	@ ln -v -i -s -T $(CURDIR)/init.el $(CONFIG_DIR)/init.el
	@ ln -v -i -s -T $(CURDIR)/packages.el $(CONFIG_DIR)/packages.el
