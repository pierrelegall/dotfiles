CONFIG = Bash
CONFIG_DIR = $(HOME)/.config/bash

all: print-info setup

print-info:
	@ echo "[$(CONFIG)]"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR) $(CONFIG_DIR)
	@ ln -v -i -s -T $(CONFIG_DIR)/bashrc $(HOME)/.bashrc
	@ ln -v -i -s -T $(CONFIG_DIR)/bash_profile $(HOME)/.bash_profile
	@ ln -v -i -s -T $(CONFIG_DIR)/inputrc $(HOME)/.inputrc
