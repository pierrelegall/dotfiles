# Variables

TOOL         = Fish
LOCAL_CONFIG = $(HOME)/.config/fish/config.fish
THIS_CONFIG  = $(shell pwd)/config.fish

# Actions

all: setup

get_tool:
	@ echo "$(TOOL)"

get_info:
	@ echo "Make your $(TOOL) local config a symlink to this config"
	@ echo "LOCAL_CONFIG = $(LOCAL_CONFIG)"
	@ echo "THIS_CONFIG  = $(THIS_CONFIG)"

setup: get_tool get_info
	@ ln -i -s $(LOCAL_CONFIG) $(YOUR_CONFIG)
