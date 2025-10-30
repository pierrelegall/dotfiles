set -U fish_greeting

function prepend_to_path_if_absent -a new_path
  contains -- $new_path $PATH; or set -px PATH $new_path
end

# Aliases
set ALIASES_DIR $HOME/.dotfiles/aliases
if test -d "$ALIASES_DIR" && test $TERM != "dumb"
  prepend_to_path_if_absent $ALIASES_DIR
end

# Commands
set COMMANDS_DIR $HOME/.dotfiles/commands
if test -d "$COMMANDS_DIR" && test $TERM != "dumb"
  prepend_to_path_if_absent $COMMANDS_DIR
end

# Starship
set STARSHIP_BIN /usr/bin/starship
if test -x "$STARSHIP_BIN" && test $TERM != "dumb"
  $STARSHIP_BIN init fish | source
  set STARSHIP_ENABLED 1
end

# Zoxide
set ZOXIDE_BIN /usr/bin/zoxide
if test -f "$ZOXIDE_BIN" && test $TERM != "dumb"
  set ZOXIDE_CMD cd
  $ZOXIDE_BIN init fish --cmd $ZOXIDE_CMD | source
  set ZOXIDE_ENABLED 1
end

# Mise
set MISE_BIN /bin/mise
if test -x "$MISE_BIN"
  $MISE_BIN activate fish | source
  set MISE_ENABLED 1
end

# Bash aliases
set BASH_ALIASES $HOME/.dotfiles/bash/includes/aliases.sh
if test -f "$BASH_ALIASES"
  source $BASH_ALIASES
  set BASH_ALIASES_ENABLED 1
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
