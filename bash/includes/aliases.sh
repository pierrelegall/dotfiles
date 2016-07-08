# Aliases

alias sudo='sudo '

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias mv='mv --interactive'
alias rm='rm --interactive=once'
alias t='trash-put'
alias tl='trash-list'

alias ls='ls --color=auto --group-directories-first --human-readable --format=vertical --indicator-style=slash'
alias ll='ls -l'
alias la='la --almost-all'
alias lla='lla -l --almost-all'

alias ln='ln --interactive'

alias df='df --human-readable'
alias du='du --human-readable'

alias grep='grep --color=auto'

alias e='emacsclient --no-wait'
alias ecf='emacsclient --no-wait --create-frame'
alias et='emacsclient --no-wait --create-frame --eval "(multi-term)"'
alias enw='emacsclient --no-window-system'

alias start-emacs='emacs --daemon'
alias kill-emacs='emacsclient --eval "(kill-emacs)"'
alias restart-emacs='kill-emacs; start-emacs'

alias kb='setxkbmap fr-colemak -option "ctrl:swap_lalt_lctl, ctrl:rctrl_ralt, shift:both_capslock"'
alias azer='kb'
alias qwer='kb'
alias qwfp='kb'
