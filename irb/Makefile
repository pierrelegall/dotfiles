CONFIG     = Irb
CONFIG_DIR = $(HOME)/.config/irb

all: print-info setup

print-info:
	@ echo "[$(CONFIG)]"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR)              $(CONFIG_DIR)
	@ ln -v -i -s -T $(CONFIG_DIR)/irbrc.rb $(HOME)/.irbrc
