CONFIG = Resolv.conf
CONFIG_DIR = $(HOME)/.config/resolvconf

all: print-info setup

print-info:
	@ echo "[$(CONFIG)]"
	@ echo "Root privileges needed, you have to run manually:"
	@ echo "$ sudo -E make -C $(CURDIR) set-system-symlinks --quiet"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR) $(CONFIG_DIR)

set-system-symlinks:
	@ ln -v -i -s -T $(CONFIG_DIR)/resolv.head.conf /etc/resolvconf/resolv.conf.d/head
