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

alias e='emacs --no-window-system'
alias se='sudo emacs --no-window-system --user $USER'
alias ew='emacs'
alias sew='sudo emacs --no-window-system --user $USER'

alias frkb='setxkbmap fr -option'
alias uskb='setxkbmap us -option'
alias kb='setxkbmap fr-colemak -option "ctrl:swap_lalt_lctl"'
alias azer='kb'
alias qwer='kb'
alias qwfp='kb'
