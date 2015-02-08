# Variables

TOOL                 = Git
LOCAL_CONFIG         = $(HOME)/.gitconfig
LOCAL_PRIVATE_CONFIG = $(HOME)/.gitprivateconfig
THIS_CONFIG          = $(CURDIR)/gitconfig
LOCAL_CONFIG_DIR     = $(HOME)/.config/gitconfig
THIS_CONFIG_DIR      = $(CURDIR)/gitconfig.d

# Actions

all: print_info setup

print_info:
	@ echo ">>> $(TOOL)"
	@ echo "LOCAL_CONFIG     = $(LOCAL_CONFIG)"
	@ echo "THIS_CONFIG      = $(THIS_CONFIG)"
	@ echo "LOCAL_CONFIG_DIR = $(LOCAL_CONFIG_DIR)"
	@ echo "THIS_CONFIG_DIR  = $(THIS_CONFIG_DIR)"
	@ echo "You have to set your own private config (like user data) manualy in $(LOCAL_PRIVATE_CONFIG)"

setup: set_links touch_local_private_config

set_links:
	@ ln -i -s -T $(THIS_CONFIG)     $(LOCAL_CONFIG)
	@ ln -i -s -T $(THIS_CONFIG_DIR) $(LOCAL_CONFIG_DIR)

touch_local_private_config:
	@ if [ ! -e $(LOCAL_PRIVATE_CONFIG) ]; then \
		touch $(LOCAL_PRIVATE_CONFIG); \
	fi;
