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

alias emacs-focus='emacsclient --eval "(select-frame-set-input-focus (selected-frame))" &>/dev/null'
alias e='emacs-focus; emacsclient --no-wait'
alias ef='emacsclient --no-wait --create-frame'

alias emacsd-start='emacs --daemon'
alias emacsd-stop='emacsclient --eval "(kill-emacs)"'
alias emacsd-restart='emacsd-stop; emacsd-start'

alias frkb='setxkbmap fr -option'
alias uskb='setxkbmap us -option'
alias kb='setxkbmap fr-colemak -option "ctrl:swap_lalt_lctl"'
alias azer='kb'
alias qwer='kb'
alias qwfp='kb'
