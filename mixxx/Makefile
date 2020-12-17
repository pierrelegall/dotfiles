CONFIG = Mixxx
CONFIG_DIR = $(HOME)/.config/mixxx

all: print-info setup

print-info:
	@ echo "[$(CONFIG)]"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR) $(CONFIG_DIR)
	@ ln -v -i -s -T "$(CONFIG_DIR)/controllers/Hercules-P32-Dwellmind.midi.xml" "$(HOME)/.mixxx/controllers/Hercules-P32-Dwellmind.midi.xml"
	@ ln -v -i -s -T $(CONFIG_DIR)/controllers/Hercules-P32-Dwellmind-scripts.js $(HOME)/.mixxx/controllers/Hercules-P32-Dwellmind-scripts.dwellmind.js
