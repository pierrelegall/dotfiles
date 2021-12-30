# Bashrc

source $HOME/.shared-config/bash/includes/exports.sh
source $HOME/.shared-config/bash/includes/aliases.sh
source $HOME/.shared-config/bash/includes/prompt.sh
source $HOME/.shared-config/bash/includes/plugins.sh
source $HOME/.shared-config/bash/includes/terminal-options.sh

PATH=$PATH:~/.bin

if [ -f ~/.bashrc-local ]; then
  source ~/.bashrc-local
fi
