all: print-info setup

print-info:
	@ echo "[starship]"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR)/starship.toml $(HOME)/.config/starship.toml
