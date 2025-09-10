CONFIG_DIR = "$(HOME)/.config/Code - OSS/User"

all: setup

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR)/settings.json $(CONFIG_DIR)/settings.json
	@ ln -v -i -s -T $(CURDIR)/keybindings.json $(CONFIG_DIR)/keybindings.json
