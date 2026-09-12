# vim: filetype=sh

export TERM=xterm-256color
export EDITOR=vim

# Some manually pre-built tools, like vim & clang-format
export PATH=~/bin:$PATH

# Quicker and better search with fzf through ag, or rg
if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
elif type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

source ~/.aliases

bindkey -v
bindkey "\ek" history-beginning-search-backward
bindkey "\ej" history-beginning-search-forward
