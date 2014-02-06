# Make this Emacs config yours

# Variables

TOOL        = Git
THIS_CONFIG = $(shell pwd)/gitconfig
YOUR_CONFIG = $(HOME)/.gitconfig

# Actions

all: info setup

info:
	@ echo "<$(TOOL)>"
	@ echo "Set your own private config (e.g. user data) manualy in ~/.gitprivateconfig"

setup:
	@ ln -i -s $(THIS_CONFIG) $(YOUR_CONFIG)

