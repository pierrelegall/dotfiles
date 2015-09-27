# Variables

TOOL             = French Colemak layout
LOCAL_CONFIG     = /usr/share/X11/xkb/symbols/fr-colemak
THIS_CONFIG      = $(CURDIR)/fr-colemak

# Actions

all: print_info setup

print_info:
	@ echo "[$(TOOL)]"
	@ echo "LOCAL_CONFIG = $(LOCAL_CONFIG)"
	@ echo "THIS_CONFIG  = $(THIS_CONFIG)"
	@ echo "/!\ Root privileges needed, you have to run manualy :"
	@ echo "> sudo make -C $(CURDIR) set_links --quiet"

setup:

set_links:
	@ ln -i -s -T $(THIS_CONFIG) $(LOCAL_CONFIG)
