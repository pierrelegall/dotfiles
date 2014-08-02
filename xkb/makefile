# Variables

TOOL         = FR Colemak layout
LOCAL_CONFIG = /usr/share/X11/xkb/symbols/fr-colemak
THIS_CONFIG  = $(shell pwd)/fr-colemak

# Actions

all: setup

get_tool:
	@ echo "$(TOOL)"

get_info:
	@ echo "Make your $(TOOL) local config a symlink to this config"
	@ echo "LOCAL_CONFIG = $(LOCAL_CONFIG)"
	@ echo "THIS_CONFIG  = $(THIS_CONFIG)"
	@ echo "Super user rights are needed to add the $(TOOL) on the system."
	@ echo "Run manualy : sudo ln -i -s $(THIS_CONFIG)" $(LOCAL_CONFIG)

setup: get_tool get_info
	@ echo "Nothing done."
