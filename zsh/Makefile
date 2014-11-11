# Variables

TOOL            = ZSH
LOCAL_CONFIG    = ~/.zshrc
THIS_CONFIG     = $(CURDIR)/zshrc
LOCAL_ALIASES   = ~/.zsh_aliases
THIS_ALIASES    = $(CURDIR)/zsh_aliases
LOCAL_INPUTS    = ~/.zsh_inputs
THIS_INPUTS     = $(CURDIR)/zsh_inputs
LOCAL_PROMPT    = ~/.zsh_prompt
THIS_PROMPT     = $(CURDIR)/zsh_prompt

# Actions

all: setup

get_info:
	@ echo "> $(TOOL)"
	@ echo "Make your $(TOOL) local config a symlink to this config"
	@ echo "LOCAL_CONFIG = $(LOCAL_CONFIG)"
	@ echo "THIS_CONFIG  = $(THIS_CONFIG)"

setup: get_info
	@ ln -i -s $(THIS_CONFIG) $(LOCAL_CONFIG)
	@ ln -i -s $(THIS_ALIASES) $(LOCAL_ALIASES)
	@ ln -i -s $(THIS_INPUTS) $(LOCAL_INPUTS)
	@ ln -i -s $(THIS_PROMPT) $(LOCAL_PROMPT)
