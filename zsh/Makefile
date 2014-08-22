# Variables

TOOL         = ZSH
LOCAL_CONFIG = $(HOME)/.zshrc
THIS_CONFIG  = $(shell pwd)/zshrc
PLUGINS_DIR  = $(shell pwd)/plugins
HL_DIR       = $(PLUGINS_DIR)/hl
HL_REPO      = https://github.com/zsh-users/zsh-syntax-highlighting 
OHMYZSH_DIR  = $(PLUGINS_DIR)/ohmyzsh
OHMYZSH_REPO = https://github.com/robbyrussell/oh-my-zsh

# Actions

all: setup

get_info:
	@ echo "> $(TOOL)"
	@ echo "Make your $(TOOL) local config a symlink to this config"
	@ echo "LOCAL_CONFIG = $(LOCAL_CONFIG)"
	@ echo "THIS_CONFIG  = $(THIS_CONFIG)"

download_plugins:
	@ echo "HL will be downloaded."
	@ mkdir -p $(HL_DIR)
	@ if [ ! -d $(HL_DIR) ]; then \
		git clone $(HL_REPO) $(HL_DIR); \
	else \
		cd $(HL_DIR); \
		git pull $(HL_REPO); \
	fi
	@ echo "OH MY ZSH will be downloaded."
	@ mkdir -p $(OHMYZSH_DIR)
	@ if [ ! -d $(OHMYZSH_DIR) ]; then \
		git clone $(OHMYZSH_REPO) $(OHMYZSH_DIR); \
	else \
		cd $(OHMYZSH_DIR); \
		git pull $(OHMYZSH_REPO); \
	fi

setup: get_info download_plugins
	@ ln -i -s $(THIS_CONFIG) $(LOCAL_CONFIG)
