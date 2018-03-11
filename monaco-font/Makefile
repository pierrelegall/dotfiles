CONFIG = Monaco font
REMOTE_FONT = https://github.com/hbin/top-programming-fonts/raw/master/Monaco-Linux.ttf

all: print-info setup

print-info:
	@ echo "[$(CONFIG)]"
	@ echo "To make the font known by the system, run manually: sudo fc-cache -fv"

setup: download-ttf

download-ttf:
	@ mkdir -p $(HOME)/.fonts
	@ wget $(REMOTE_FONT) -O $(HOME)/.fonts/Monaco.ttf
