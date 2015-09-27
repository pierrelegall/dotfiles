# Variables

TOOL                = Bash
LOCAL_CONFIG        = $(HOME)/.bashrc
THIS_CONFIG         = $(CURDIR)/bashrc
LOCAL_INPUTS_CONFIG = $(HOME)/.inputrc
THIS_INPUTS_CONFIG  = $(CURDIR)/inputrc
LOCAL_CONFIG_DIR    = $(HOME)/.config/bash
THIS_CONFIG_DIR     = $(CURDIR)/bash.d

# Actions

all: print_info setup

print_info:
	@ echo "[$(TOOL)]"
	@ echo "LOCAL_CONFIG     = $(LOCAL_CONFIG)"
	@ echo "THIS_CONFIG      = $(THIS_CONFIG)"
	@ echo "LOCAL_CONFIG_DIR = $(LOCAL_CONFIG_DIR)"
	@ echo "THIS_CONFIG_DIR  = $(THIS_CONFIG_DIR)"

setup: set_links

set_links:
	@ ln -i -s -T $(THIS_CONFIG)        $(LOCAL_CONFIG)
	@ ln -i -s -T $(THIS_INPUTS_CONFIG) $(LOCAL_INPUTS_CONFIG)
	@ ln -i -s -T $(THIS_CONFIG_DIR)    $(LOCAL_CONFIG_DIR)
