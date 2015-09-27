CONFIG     = Git
CONFIG_DIR = $(HOME)/.config/git

all: print-info setup

print-info:
	@ echo "[$(CONFIG)]"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR)               $(CONFIG_DIR)
	@ ln -v -i -s -T $(CONFIG_DIR)/gitconfig $(HOME)/.gitconfig
