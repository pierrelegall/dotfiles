set -U fish_greeting

source $HOME/.dotfiles/fish/emacs-vterm.fish
source $HOME/.dotfiles/bash/includes/aliases.sh

set ASDF_SOURCE /opt/asdf-vm/asdf.fish
if test -f $ASDF_SOURCE
  source $ASDF_SOURCE
end

bind \cg cancel
bind --erase --all \cj

# This should be set in a local only config file
# WARNING: it works, however saving is not done instantly
set -U ERL_AFLAGS "-kernel shell_history enabled"
