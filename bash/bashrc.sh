# Bashrc

source $HOME/.dotfiles/bash/includes/exports.sh
source $HOME/.dotfiles/bash/includes/aliases.sh
source $HOME/.dotfiles/bash/includes/plugins.sh
source $HOME/.dotfiles/bash/includes/terminal-options.sh

# Mise
MISE_BIN=$(command -pv mise)
if [ -f $MIS_BIN ]; then
  eval "$($MISE_BIN activate bash)"
  MISE_ENABLED=1
fi

if [ -f ~/.bashrc-local ]; then
  source ~/.bashrc-local
fi

# Config below enabled only for interactive shells
if [ $TERM = "dumb" ]; then return 0; fi

# Starship
STARSHIP_BIN=$(command -pv starship)
if [ -f $STARSHIP_BIN ]; then
  eval "$($STARSHIP_BIN init bash)"
  STARSHIP_ENABLED=1
fi

