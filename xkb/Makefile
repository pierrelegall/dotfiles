CONFIG     = Xkb
CONFIG_DIR = $(HOME)/.config/xkb

all: print-info setup

print-info:
	@ echo "[$(CONFIG)]"
	@ echo "Root privileges needed, you have to run manualy :"
	@ echo "> sudo make -C $(CURDIR) set-system-symlinks --quiet"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR) $(CONFIG_DIR)

set-system-symlinks:
	@ ln -v -i -s -T $(CONFIG_DIR)/fr-colemak /usr/share/X11/xkb/symbols/fr-colemak
