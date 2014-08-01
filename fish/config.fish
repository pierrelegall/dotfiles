# Variable set

set VDL_PATH $HOME/videos/downloaded
set PATH $HOME/.gem/ruby/2.1.0/bin/ $PATH

## Aliases ##

alias grep='grep --color=auto'

alias rm='rm -I'
alias mv='mv -i'

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ls -lhA'

alias mkdir='mkdir -p'
alias df='df -h'

alias ed='emacs -nw'

alias sf='php app/console'

alias vdl='youtube-dl -o "$VDL_PATH/%(title)s.%(ext)s"'

alias azer='setxkbmap ud'
alias qwfp='setxkbmap fr'
