# Make this Emacs config yours

# Variables

TOOL        = RubyGem
THIS_CONFIG = $(shell pwd)/gemrc
YOUR_CONFIG = $(HOME)/.gemrc

# Actions

all: info setup

info:
	@ echo "<$(TOOL)>"

setup:
	@ ln -i -s $(THIS_CONFIG) $(YOUR_CONFIG)

