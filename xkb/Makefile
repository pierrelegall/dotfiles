# Variables

TOOL             = French Colemak layout
LOCAL_CONFIG     = /usr/share/X11/xkb/symbols/fr-colemak
THIS_CONFIG      = $(CURDIR)/fr-colemak

# Actions

all: print-info setup

print-info:
	@ echo "[$(TOOL)]"
	@ echo "LOCAL_CONFIG = $(LOCAL_CONFIG)"
	@ echo "THIS_CONFIG  = $(THIS_CONFIG)"
	@ echo "/!\ Root privileges needed, you have to run manualy :"
	@ echo "> sudo make -C $(CURDIR) set-symlinks --quiet"

setup:

set-symlinks:
	@ ln -i -s -T $(THIS_CONFIG) $(LOCAL_CONFIG)
