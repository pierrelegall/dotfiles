# Variables

CONFIG     = i3
CONFIG_DIR = $(HOME)/.config/i3

# Actions

all: print-info setup

print-info:
	@ echo "[$(CONFIG)]"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR) $(CONFIG_DIR)
