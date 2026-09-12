# vim: filetype=sh

if [ -z "$ZSH_VERSION" ]; then
  # Don't export this on macOS, it breaks everything
  export LC_ALL=en_US.utf8
fi
export TERM=xterm-256color
if type shopt > /dev/null; then
  shopt -s checkwinsize
fi
stty erase "^?"

# Helper functions
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/functions.sh

export EDITOR=vim

# Some manually pre-built tools, like vim & clang-format
# FIXME: field_prepend doesn't seem to work with zsh
# field_prepend PATH ~/bin
export PATH=~/bin:$PATH

# Quicker and better search with fzf through ag, or rg
if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
elif type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

if [ -z "$ZSH_VERSION" ]; then
  # zsh uses its own syntax for functions, so those calls result in gibberish
  export PS1=$(build_ps_one)
  export LS_COLORS=$(build_ls_colors)
fi

if [ -r $HOME/.aliases ]; then
  . $HOME/.aliases
fi

if [ -r $HOME/.profile.asachkov.internal ]; then
  . $HOME/.profile.asachkov.internal
fi

