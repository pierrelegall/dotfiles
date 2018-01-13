# Aliases

alias sudo='sudo '

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias mv='mv --interactive'
alias rm='rm --interactive=once'

alias ls='ls --color=auto --literal --group-directories-first --human-readable --format=vertical --indicator-style=slash'
alias ll='ls -l'
alias la='la --almost-all'
alias lla='lla -l --almost-all'

alias ln='ln --interactive'

alias df='df --human-readable'
alias du='du --human-readable'

alias grep='grep --color=auto'

alias e='emacsclient25 --no-wait'
alias ecf='emacsclient25 --no-wait --create-frame'
alias et='emacsclient25 --no-wait --create-frame --eval "(multi-term)"'
alias enw='emacsclient25 --nw'

alias emacsd-start='emacs25 --daemon'
alias emacsd-stop='emacsclient25 --eval "(kill-emacs)"'
alias emacsd-restart='emacsd-stop; emacsd-start'

alias frkb='setxkbmap fr -option'
alias kb='setxkbmap fr-colemak -option "ctrl:swap_lalt_lctl, ctrl:rctrl_ralt"'
alias azer='kb'
alias qwer='kb'
alias qwfp='kb'

alias notify='\
  notify-send "Something coming to its end…"; \
  echo; echo "Notified!"; \
  (paplay $HOME/.config/bash/assets/sounds/notify.ogg &)'

alias eshell-aliases-update="\
  alias | \
  sed -E \"s/^alias ([^=]+)='(.*)'$/alias \1 \2 \$\*/g; s/'\\\''/'/g;\" \
  >~/.emacs.d/eshell/alias"
