# Variables

TOOL             = French Colemak layout
LOCAL_CONFIG     = /usr/share/X11/xkb/symbols/fr-colemak
THIS_CONFIG      = $(CURDIR)/symbols/fr-colemak
LOCAL_CONFIG_DIR = $(HOME)/.config/xkb
THIS_CONFIG_DIR  = $(CURDIR)/xkb.d

# Actions

all: print_info setup

print_info:
	@ echo ">>> $(TOOL)"
	@ echo "LOCAL_CONFIG = $(LOCAL_CONFIG)"
	@ echo "THIS_CONFIG  = $(THIS_CONFIG)"
	@ echo "/!\ Root privileges needed !!!"
	@ echo "You have to run manualy : sudo ln -i -s $(THIS_CONFIG) $(LOCAL_CONFIG)"

setup: set_links

set_links:
	@ ln -i -s -T $(THIS_CONFIG)     $(LOCAL_CONFIG)
	@ ln -i -s -T $(THIS_CONFIG_DIR) $(LOCAL_CONFIG_DIR)

use_layout:
	setxkbmap -I ~/.myconfig/xkb/xkb.d fr-colemak swap-ctrl-alt -print | \
	xkbcomp -I$(HOME)/.myconfig/xkb/xkb.d - $(DISPLAY)
