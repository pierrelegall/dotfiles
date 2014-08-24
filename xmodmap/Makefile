# Variables

TOOL         = Xmodmap
LOCAL_CONFIG = $(HOME)/.xmodmap
THIS_CONFIG  = $(shell pwd)/xmodmap

# Actions

all: setup

get_info:
	@ echo "> $(TOOL)"
	@ echo "Make your $(TOOL) local config a symlink to this config"
	@ echo "LOCAL_CONFIG = $(LOCAL_CONFIG)"
	@ echo "THIS_CONFIG = $(THIS_CONFIG)"

setup: get_info
	@ ln -i -s $(THIS_CONFIG) $(LOCAL_CONFIG)
