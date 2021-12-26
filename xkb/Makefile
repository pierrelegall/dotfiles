CONFIG = Xkb
CONFIG_DIR = $(HOME)/.config/xkb

all: print-info setup

print-info:
	@ echo "[$(CONFIG)]"

setup: set-symlinks

set-symlinks:
	@ mkdir -p $(CONFIG_DIR)
	@ ln -v -i -s -T $(CURDIR)/symbols $(CONFIG_DIR)/symbols

set-system-symlinks:
	@ ln -v -i -s -T $(CONFIG_DIR)/symbols/fr-colemak /usr/share/X11/xkb/symbols/fr-colemak
