CONFIG = Visual Studio Code
CONFIG_DIR = $(HOME)/.config/Code/User

all: print-info setup

print-info:
	@ echo "[$(CONFIG)]"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR)/settings.json $(CONFIG_DIR)/settings.json
	@ ln -v -i -s -T $(CURDIR)/keybindings.json $(CONFIG_DIR)/keybindings.json

add-repository:
	@ curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
	@ sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
	@ sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
