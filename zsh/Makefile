# Variables

TOOL             = Zsh
LOCAL_CONFIG     = $(HOME)/.zshrc
THIS_CONFIG      = $(CURDIR)/zshrc
LOCAL_CONFIG_DIR = $(HOME)/.zsh.d
THIS_CONFIG_DIR  = $(CURDIR)/zsh.d

# Actions

all: setup

get_info:
	@ echo ">>> $(TOOL)"
	@ echo "LOCAL_CONFIG     = $(LOCAL_CONFIG)"
	@ echo "THIS_CONFIG      = $(THIS_CONFIG)"
	@ echo "LOCAL_CONFIG_DIR = $(LOCAL_CONFIG_DIR)"
	@ echo "THIS_CONFIG_DIR  = $(THIS_CONFIG_DIR)"

setup: get_info
	@ ln -i -s -T $(THIS_CONFIG) $(LOCAL_CONFIG)
	@ ln -i -s -T $(THIS_CONFIG_DIR) $(LOCAL_CONFIG_DIR)
