# Variables

TOOL                 = Git
LOCAL_CONFIG         = $(HOME)/.gitconfig
THIS_CONFIG          = $(shell pwd)/gitconfig
THIS_PRIVATE_CONFIG  = $(shell pwd)/gitprivateconfig

# Actions

all: setup

get_tool:
	@ echo "$(TOOL)"

get_info:
	@ echo "Make your $(TOOL) local config a symlink to this config"
	@ echo "LOCAL_CONFIG = $(LOCAL_CONFIG)"
	@ echo "THIS_CONFIG  = $(THIS_CONFIG)"
	@ echo "Set your own private config (e.g. user data) manualy in $(THIS_PRIVATE_CONFIG)"

touch_private_config:
	@ if [ ! -e $(THIS_PRIVATE_CONFIG) ]; then \
		touch $(THIS_PRIVATE_CONFIG); \
	fi;

setup: get_tool get_info touch_private_config
	@ ln -i -s $(LOCAL_CONFIG) $(YOUR_CONFIG)
