# Variables

TOOL         = ZSH
LOCAL_CONFIG = $(HOME)/.zshrc
THIS_CONFIG  = $(shell pwd)/zshrc
PLUGINS_DIR  = $(shell pwd)/plugins
# Actions

all: setup

get_info:
	@ echo "> $(TOOL)"
	@ echo "Make your $(TOOL) local config a symlink to this config"
	@ echo "LOCAL_CONFIG = $(LOCAL_CONFIG)"
	@ echo "THIS_CONFIG  = $(THIS_CONFIG)"

download_plugins:
	@ echo "Plugins will be Download."
	@ mkdir -p $(PLUGINS_DIR)
	git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $(PLUGINS_DIR)/hl

setup: get_info download_plugins
	@ ln -i -s $(THIS_CONFIG) $(LOCAL_CONFIG)
