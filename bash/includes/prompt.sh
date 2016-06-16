# Bash prompt

source $HOME/.config/bash/includes/git-prompt.sh

if [ “$(id -u)” == “0” ]; then
  export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 5)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 6)\]\w\[$(tput setaf 3)\]\$(__git_ps1)\[$(tput setaf 4)\]]\n\[$(tput setaf 1)\]# \[$(tput sgr0)\]\[$(tput sgr0)\]"
  export PROMPT_COMMAND="echo;"
else
  export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 5)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 6)\]\w\[$(tput setaf 3)\]\$(__git_ps1)\[$(tput setaf 4)\]]\n\[$(tput setaf 2)\]\\$ \[$(tput sgr0)\]\[$(tput sgr0)\]"
  export PROMPT_COMMAND="echo;"
fi
