# vim: filetype=sh

export LC_ALL=en_US.utf8
export TERM=xterm-256color
shopt -s checkwinsize
stty erase "^?"

# Helper functions
source ~/.dotfiles/functions.sh

export EDITOR=vim

# Some manually pre-built tools, like vim & clang-format
field_prepend PATH ~/bin

export PS1=$(build_ps_one)
export LS_COLORS=$(build_ls_colors)

if [ -r $HOME/.aliases ]; then
  . $HOME/.aliases
fi

if [ -r $HOME/.profile.asachkov.internal ]; then
  . $HOME/.profile.asachkov.internal
fi

