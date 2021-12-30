all: print-info setup

print-info:
	@ echo "[mixxx]"

setup: set-symlinks

set-symlinks:
	@ ln -v -i -s -T $(CURDIR)/controllers/Hercules-P32-Dwellmind.midi.xml $(HOME)/.mixxx/controllers/Hercules-P32-Dwellmind.midi.xml
	@ ln -v -i -s -T $(CURDIR)/controllers/Hercules-P32-Dwellmind-scripts.js $(HOME)/.mixxx/controllers/Hercules-P32-Dwellmind-scripts.js
