# Bashrc

source $HOME/.config/bash/includes/exports.sh
source $HOME/.config/bash/includes/aliases.sh
source $HOME/.config/bash/includes/prompt.sh
source $HOME/.config/bash/includes/plugins.sh
source $HOME/.config/bash/includes/terminal-options.sh

PATH=$PATH:~/.bin

if [ -f ~/.bashrc-local ]; then
  source ~/.bashrc-local
fi
