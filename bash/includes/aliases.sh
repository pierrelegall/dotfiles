# Aliases

alias sudo='sudo '
alias x='exit'

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

alias emacs-focus='emacsclient --no-wait --eval "(select-frame-set-input-focus (selected-frame))" &>/dev/null'
alias e='emacsclient --no-wait'
alias ecf='emacsclient --no-wait --create-frame; emacs-focus'
alias es='emacsclient --no-wait --eval "(progn (raise-frame) (select-frame-set-input-focus (selected-frame)))"'
alias enw='emacsclient --no-window-system'

alias emacsd-start='emacs --daemon'
alias emacsd-stop='emacsclient --eval "(kill-emacs)"'
alias emacsd-restart='emacsd-stop && emacsd-start'

alias se='sudo emacs --no-window-system --user $USER'
alias sew='sudo emacs --no-window-system --user $USER'

alias s='ddgr --gui-browser --noprompt !ddg'
alias j='z'
alias jj='z -d'
alias b='prevd'
alias f='nextd'

alias iex='iex --erl "-kernel shell_history enabled"'
alias zed="zeditor"
