# Variables

TOOL             = RubyGem
LOCAL_CONFIG     = $(HOME)/.gemrc
THIS_CONFIG      = $(CURDIR)/gemrc
LOCAL_CONFIG_DIR = $(HOME)/.config/gemrc
THIS_CONFIG_DIR  = $(CURDIR)/gemrc.d

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
