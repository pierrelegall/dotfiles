# Variables

TOOL         = FR Colemak layout
LOCAL_CONFIG = /usr/share/X11/xkb/symbols/fr-colemak
THIS_CONFIG  = $(shell pwd)/symbols/fr-colemak

# Actions

all: setup

get_info:
	@ echo "> $(TOOL)"
	@ echo "Make your $(TOOL) local config a symlink to this config"
	@ echo "LOCAL_CONFIG = $(LOCAL_CONFIG)"
	@ echo "THIS_CONFIG  = $(THIS_CONFIG)"
	@ echo "/!\ Root privileges needed !!!"
	@ echo "You have to run manualy : sudo ln -i -s $(THIS_CONFIG) $(LOCAL_CONFIG)"

setup: get_info
