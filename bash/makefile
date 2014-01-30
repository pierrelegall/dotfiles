# Make this Emacs config yours

# Variables

TOOL        = Bash
THIS_CONFIG = $(shell pwd)/bashrc
YOUR_CONFIG = $(HOME)/.bashrc

# Actions

all: set

set:
	@ echo "<$(TOOL)>"
	@ ln -i -s $(THIS_CONFIG) $(YOUR_CONFIG)

