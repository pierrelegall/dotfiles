# Make this Emacs config yours

# Variables

TOOL        = Git
THIS_CONFIG = $(shell pwd)/gitconfig
YOUR_CONFIG = $(HOME)/.gitconfig

# Actions

all: set info

set:
	@ echo "<$(TOOL)>"
	@ ln -i -s $(THIS_CONFIG) $(YOUR_CONFIG)

info:
	@ echo "Set up your own private config (e.g. user data) manualy in ~/.gitprivateconfig"

