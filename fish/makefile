# Make this Emacs config yours

# Variables

TOOL        = Fish
THIS_CONFIG = $(shell pwd)/.config/fish/config.fish
YOUR_CONFIG = $(HOME)/config.fish

# Actions

all: set

set:
	@ echo "<$(TOOL)>"
	@ ln -i -s $(THIS_CONFIG) $(YOUR_CONFIG)

