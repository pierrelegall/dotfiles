all: print-info setup

print-info:
	@ echo "[irb]"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR)/irbrc.rb $(HOME)/.irbrc
