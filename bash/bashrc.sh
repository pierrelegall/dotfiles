# Bashrc

source $HOME/.dotfiles/bash/includes/exports.sh
source $HOME/.dotfiles/bash/includes/aliases.sh
source $HOME/.dotfiles/bash/includes/plugins.sh
source $HOME/.dotfiles/bash/includes/terminal-options.sh

PATH=$PATH:~/.bin

if [ -f ~/.bashrc-local ]; then
  source ~/.bashrc-local
fi
