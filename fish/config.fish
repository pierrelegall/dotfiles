set -U fish_greeting

source $HOME/.dotfiles/fish/prompt.fish
source $HOME/.dotfiles/fish/emacs-vterm.fish
source $HOME/.dotfiles/bash/includes/aliases.sh

set ASDF_SOURCE /opt/asdf-vm/asdf.fish
if test -f $ASDF_SOURCE
  source $ASDF_SOURCE
end

bind \cg cancel
bind --erase --all \cj
