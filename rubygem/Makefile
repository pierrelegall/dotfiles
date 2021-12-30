all: print-info setup

print-info:
	@ echo "[rubygem]"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CONFIG_DIR)/gemrc $(HOME)/.gemrc
