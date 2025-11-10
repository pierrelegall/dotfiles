# Aliases

alias sudo='sudo '
alias q='exit'
alias x='exit'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias mv='mv --interactive'
alias rm='rm --interactive=once'

alias ln='ln --interactive'

alias df='df --human-readable'
alias du='du --human-readable'

alias grep='grep --color=auto'

alias emacs-focus='emacsclient --no-wait --eval "(select-frame-set-input-focus (selected-frame))" &>/dev/null'
alias e='emacsclient --no-wait'
alias ecf='emacsclient --no-wait --create-frame; emacs-focus'
alias es='emacsclient --no-wait --eval "(progn (raise-frame) (select-frame-set-input-focus (selected-frame)))"'
alias enw='emacsclient --no-window-system'
alias nano='emacs -q -nw'

alias emacsd-start='emacs --daemon'
alias emacsd-stop='emacsclient --eval "(kill-emacs)"'
alias emacsd-restart='emacsd-stop && emacsd-start'

alias se='sudo emacs --no-window-system --user $USER'
alias sew='sudo emacs --no-window-system --user $USER'

alias b='prevd'
alias f='nextd'

alias iex='iex --erl "-kernel shell_history enabled"'
