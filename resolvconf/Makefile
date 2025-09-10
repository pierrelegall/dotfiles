all: print-info setup

print-info:
	@ echo "Root privileges needed, you have to run manually:"
	@ echo "$ sudo -E make -C $(CURDIR) set-system-symlinks --quiet"

setup:

set-system-symlinks:
	@ mkdir -p /etc/resolvconf/resolv.conf.d
	@ ln -v -i -s -T $(CURDIR)/resolv.head.conf /etc/resolvconf/resolv.conf.d/head
