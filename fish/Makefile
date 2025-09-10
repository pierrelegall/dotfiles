CONFIG_DIR = $(HOME)/.config/fish

all: setup

setup: set-symlinks

set-symlinks:
	@ mkdir -p $(CONFIG_DIR)
	@ ln -v -i -s -T $(CURDIR)/config.fish $(CONFIG_DIR)/config.fish
