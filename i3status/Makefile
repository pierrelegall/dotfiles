# Variables

TOOL             = i3status
LOCAL_CONFIG_DIR = $(HOME)/.config/i3status
THIS_CONFIG_DIR  = $(CURDIR)

# Actions

all: print_info setup

print_info:
	@ echo "[$(TOOL)]"
	@ echo "LOCAL_CONFIG_DIR = $(LOCAL_CONFIG_DIR)"
	@ echo "THIS_CONFIG_DIR  = $(THIS_CONFIG_DIR)"

setup: set_links

set_links:
	@ ln -i -s -T $(THIS_CONFIG_DIR) $(LOCAL_CONFIG_DIR)
