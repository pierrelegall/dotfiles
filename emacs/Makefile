# Variables

TOOL             = Emacs
LOCAL_CONFIG     = $(HOME)/.emacs
THIS_CONFIG      = $(CURDIR)/emacs
LOCAL_CONFIG_DIR = $(HOME)/.config/emacs
THIS_CONFIG_DIR  = $(CURDIR)/emacs.d

# Actions

all: print-info setup

print-info:
	@ echo "[$(TOOL)]"
	@ echo "LOCAL_CONFIG     = $(LOCAL_CONFIG)"
	@ echo "THIS_CONFIG      = $(THIS_CONFIG)"
	@ echo "LOCAL_CONFIG_DIR = $(LOCAL_CONFIG_DIR)"
	@ echo "THIS_CONFIG_DIR  = $(THIS_CONFIG_DIR)"

setup: set-symlinks

set-symlinks:
	@ ln -i -s -T $(THIS_CONFIG)     $(LOCAL_CONFIG)
	@ ln -i -s -T $(THIS_CONFIG_DIR) $(LOCAL_CONFIG_DIR)
