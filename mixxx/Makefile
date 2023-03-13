all: print-info setup

print-info:
	@ echo "[mixxx]"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR)/controllers $(HOME)/.mixxx/controllers
