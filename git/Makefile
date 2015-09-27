# Variables

TOOL                 = Git
LOCAL_CONFIG         = $(HOME)/.gitconfig
LOCAL_PRIVATE_CONFIG = $(HOME)/.config/git/private
THIS_CONFIG          = $(CURDIR)/gitconfig
LOCAL_CONFIG_DIR     = $(HOME)/.config/git
THIS_CONFIG_DIR      = $(CURDIR)/git.d

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
	@ ln -i -s -T $(THIS_CONFIG)     $(LOCAL_CONFIG)
	@ ln -i -s -T $(THIS_CONFIG_DIR) $(LOCAL_CONFIG_DIR)
