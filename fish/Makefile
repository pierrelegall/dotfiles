CONFIG = Fish
CONFIG_DIR = $(HOME)/.config/fish

all: print-info setup

print-info:
	@ echo "[$(CONFIG)]"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR)/config.fish $(CONFIG_DIR)/config.fish
	@ ln -v -i -s -T $(CURDIR)/prompt.fish $(CONFIG_DIR)/prompt.fish
