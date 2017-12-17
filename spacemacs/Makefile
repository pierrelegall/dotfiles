CONFIG = Spacemacs
CONFIG_DIR = $(HOME)/.config/spacemacs
SPACEMACS_DIR = $(HOME)/.spacemacs.dddd
SPACEMACS_REPO = https://github.com/syl20bnr/spacemacs

all: print-info setup

print-info:
	@ echo "[$(CONFIG)]"

setup: $(SPACEMACS_DIR) set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR) $(CONFIG_DIR)
	@ ln -v -i -s -T $(CONFIG_DIR)/init.el $(HOME)/.emacs
	@ ln -v -i -s -T $(CONFIG_DIR)/init-spacemacs.el $(HOME)/.spacemacs

$(SPACEMACS_DIR):
	@ git clone $(SPACEMACS_REPO) $(SPACEMACS_DIR)
