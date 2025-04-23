# Bashrc

source $HOME/.dotfiles/bash/includes/exports.sh
source $HOME/.dotfiles/bash/includes/aliases.sh
source $HOME/.dotfiles/bash/includes/plugins.sh
source $HOME/.dotfiles/bash/includes/terminal-options.sh

PATH=$PATH:~/.bin

# Starship
STARSHIP_BIN=/usr/bin/starship
if [[ -f ${STARSHIP_BIN} && "$TERM" != "dumb" ]]; then
  eval "$($STARSHIP_BIN init bash)"
  STARSHIP_ENABLED=1
fi

if [ -f ~/.bashrc-local ]; then
  source ~/.bashrc-local
fi
