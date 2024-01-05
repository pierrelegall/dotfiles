all: print-info setup

print-info:
	@ echo "[zsh]"

setup: deps/pure-prompt set-symlinks

deps/pure-prompt:
	@ git clone --depth=1 https://github.com/sindresorhus/pure.git deps/pure-prompt

set-symlinks:
	@ ln -v -i -s -T $(CURDIR)/zshrc $(HOME)/.zshrc
