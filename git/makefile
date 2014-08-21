# Variables

TOOL                 = Git
LOCAL_CONFIG         = $(HOME)/.gitconfig
LOCAL_PRIVATE_CONFIG = $(HOME)/.gitprivateconfig
THIS_CONFIG          = $(shell pwd)/gitconfig

# Actions

all: setup

get_tool:
	@ echo "$(TOOL)"

get_info:
	@ echo "Make your $(TOOL) local config a symlink to this config"
	@ echo "LOCAL_CONFIG = $(LOCAL_CONFIG)"
	@ echo "THIS_CONFIG  = $(THIS_CONFIG)"
	@ echo "You have to set your own private config (like user data) manualy in $(LOCAL_PRIVATE_CONFIG)"

touch_local_private_config:
	@ if [ ! -e $(LOCAL_PRIVATE_CONFIG) ]; then \
		touch $(LOCAL_PRIVATE_CONFIG); \
	fi;

setup: get_tool get_info touch_local_private_config
	@ ln -i -s $(THIS_CONFIG) $(LOCAL_CONFIG)
