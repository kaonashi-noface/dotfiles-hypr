function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}



##############################
# PATH Configurations
##############################
export XDG_SESSION_TYPE="wayland"
export XDG_CONFIG_HOME="$HOME/.config"

# Initialize Starship
eval "$(starship init zsh)"



########################################
# Runtime Environment Configurations
########################################
# Set your default version
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion # This loads nvm bash_completion
# Auto-use .nvmrc when present, otherwise use default
autoload -U add-zsh-hook
load-nvmrc() {
    if [[ -f .nvmrc ]]; then
        nvm use > /dev/null 2>&1
    fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc



########################################
# LOAD ZSH PLUGIN
########################################
# Setup zsh plugins
source "$XDG_CONFIG_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$XDG_CONFIG_HOME/zsh/zsh-completions/zsh-completions.plugin.zsh"
source "$XDG_CONFIG_HOME/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$XDG_CONFIG_HOME/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "$XDG_CONFIG_HOME/zsh/zsh-you-should-use/you-should-use.plugin.zsh"
source "$XDG_CONFIG_HOME/zsh/zsh-256color/zsh-256color.plugin.zsh"



########################################
# ZSH PLUGIN ALIASES
########################################
# Setup Substring Search Aliases
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down



########################################
# ZSH CONFIGURATIONS
########################################
# Setup zsh history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Setup zsh completion
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"



########################################
# CUSTOM ALIASES
########################################
# Setup directory navigation aliases
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias mkdir="mkdir -p"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias code="code --force-device-scale-factor=1.25"



