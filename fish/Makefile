CONFIG_DIR = $(HOME)/.config/fish

all: print-info setup

print-info:
	@ echo "[fish]"

setup: set-symlinks

set-symlinks:
	@ mkdir -p $(CONFIG_DIR)
	@ ln -v -i -s -T $(CURDIR)/config.fish $(CONFIG_DIR)/config.fish
	@ ln -v -i -s -T $(CURDIR)/prompt.fish $(CONFIG_DIR)/prompt.fish
