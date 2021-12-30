CONFIG_DIR = $(HOME)/.config/xkb

all: print-info setup

print-info:
	@ echo "[xkb]"

setup: set-symlinks

set-symlinks:
	@ mkdir -p $(CONFIG_DIR)
	@ ln -v -i -s -T $(CURDIR)/symbols $(CONFIG_DIR)/symbols
	@ ln -v -i -s -T $(CONFIG_DIR)/symbols/fr-colemak $(CONFIG_DIR)/symbols/custom

set-system-symlinks:
	@ ln -v -i -s -T $(CONFIG_DIR)/symbols/fr-colemak /usr/share/X11/xkb/symbols/fr-colemak
