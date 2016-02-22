# Aliases

alias sudo='sudo '

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias grep='grep --color=auto'

alias rm='rm -I'
alias mv='mv -i'

alias ls='ls --color=auto --group-directories-first --human-readable --format=vertical --indicator-style=slash'
alias ll='ls -lh'
alias la='ls -A'
alias lla='la -l'
alias ln='ln -i'

alias df='df -h'
alias du='du -h'

alias sc='systemctl'

alias e='emacsclient --no-wait'
alias ecf='emacsclient --no-wait --create-frame'
alias enw='emacsclient -nw'

sudo-e() {
  e /sudo::$1
}

sudo-ecf() {
  ecf /sudo::$1
}

sudo-enw() {
  enw /sudo::$1
}

alias kb='setxkbmap fr-colemak swap-ctrl-alt'
alias azer='kb'
alias qwer='kb'
alias qwfp='kb'

alias en='dict -d wn'
alias fr='dict -d french'
alias enc='dict -d foldoc'
alias enfr='dict -d fd-eng-fra'
alias fren='dict -d fd-fra-eng'

alias vdl='download-stream'

# Weather

meteo() {
  curl wttr.in/$1
}

# Helpers

download-stream() {
	youtube-dl -o "~/Videos/%(title)s-%(id)s.%(ext)s" "$1"
}
