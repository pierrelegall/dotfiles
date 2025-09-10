CONFIG_DIR = $(HOME)/.doom.d

all: setup

setup: set-symlinks

set-symlinks:
	@ mkdir -p $(CONFIG_DIR)
	@ ln -v -i -s -T $(CURDIR)/config.el $(CONFIG_DIR)/config.el
	@ ln -v -i -s -T $(CURDIR)/custom.el $(CONFIG_DIR)/custom.el
	@ ln -v -i -s -T $(CURDIR)/init.el $(CONFIG_DIR)/init.el
	@ ln -v -i -s -T $(CURDIR)/packages.el $(CONFIG_DIR)/packages.el
