# Aliases

alias sudo='sudo '

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias grep='grep --color=auto'
alias grepr='grep -rn'

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

alias kb='setxkbmap fr-colemak swap-ctrl-alt'
alias azer='kb'
alias qwer='kb'
alias qwfp='kb'

alias en='dict -d wn'
alias fr='dict -d french'
alias enc='dict -d foldoc'
alias en2fr='dict -d fd-eng-fra'
alias fr2en='dict -d fd-fra-eng'

alias jsconsole='firefox -jsconsole'
alias jsc='jsconsole'

alias dst='download-stream'
alias wst='watch-stream'
alias lst='listen-stream'

# Helpers

download-stream() {
	mkdir -p $VIDEO_PATH
	youtube-dl -o "$VIDEO_PATH/%(title)s-%(id)s.%(ext)s" "$1"
}

watch-stream() {
	mpv -fs -cookies $(youtube-dl -g $1)
}

listen-stream() {
	mpv --no-video -cookies $(youtube-dl -g $1)
}
