all: setup

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR)/bashrc.sh $(HOME)/.bashrc
	@ ln -v -i -s -T $(CURDIR)/bash_profile.sh $(HOME)/.bash_profile
	@ ln -v -i -s -T $(CURDIR)/inputrc $(HOME)/.inputrc
