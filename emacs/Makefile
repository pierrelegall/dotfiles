# Variables

TOOL         = Emacs
LOCAL_CONFIG = $(HOME)/.emacs
THIS_CONFIG  = $(CURDIR)/emacs

# Actions

all: print_info setup

print_info:
	@ echo ">>> $(TOOL)"
	@ echo "LOCAL_CONFIG = $(LOCAL_CONFIG)"
	@ echo "THIS_CONFIG  = $(THIS_CONFIG)"

setup:
	@ ln -i -s $(THIS_CONFIG) $(LOCAL_CONFIG)
