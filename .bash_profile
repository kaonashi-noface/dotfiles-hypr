#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export SHELL=$(which zsh)
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l

