set -U fish_greeting

source $HOME/.dotfiles/bash/includes/aliases.sh

# Starship
set STARSHIP_BIN /usr/bin/starship
if test -f $STARSHIP_BIN && test $TERM != "dumb"
  $STARSHIP_BIN init fish | source
  set STARSHIP_ENABLED 1
end

# Zoxide
set ZOXIDE_BIN /usr/bin/zoxide
set ZOXIDE_CMD cd
if test -f $ZOXIDE_BIN && test $TERM != "dumb"
  $ZOXIDE_BIN init fish --cmd $ZOXIDE_CMD | source
  set ZOXIDE_ENABLED 1
end

# Mise
set MISE_BIN /bin/mise
if test -f $MISE_BIN
  $MISE_BIN activate fish | source
  set MISE_ENABLED 1
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

# This need to be at the end to work properly
if test -n $INSIDE_EMACS
  source $HOME/.dotfiles/fish/emacs-vterm.fish
end
