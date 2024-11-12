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

function sudo -d "sudo wrapper that handles aliases"
  if functions -q -- $argv[1]
    set -l new_args (string join ' ' -- (string escape -- $argv))
    set argv fish -c "$new_args"
  end

  command sudo $argv
end
