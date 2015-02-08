# Variables

TOOL         = RubyGem
LOCAL_CONFIG = $(HOME)/.gemrc
THIS_CONFIG  = $(CURDIR)/gemrc

# Actions

all: print_info setup

print_info:
	@ echo ">>> $(TOOL)"
	@ echo "LOCAL_CONFIG = $(LOCAL_CONFIG)"
	@ echo "THIS_CONFIG  = $(THIS_CONFIG)"

setup:
	@ ln -i -s $(THIS_CONFIG) $(LOCAL_CONFIG)
