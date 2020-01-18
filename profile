# vim: filetype=sh

export LC_ALL=en_US.utf8
export TERM=xterm-256color
shopt -s checkwinsize
stty erase "^?"

# Helper functions
source ~/.dotfiles/functions.sh

field_append PATH ~
field_prepend PATH /usr/local/bin # New manually-built vim 8

export PS1=$(build_ps_one)
export LS_COLORS=$(build_ls_colors)

if [ -r $HOME/.aliases ]; then
  . $HOME/.aliases
fi

if [ -r $HOME/.profile.asachkov.internal ]; then
  . $HOME/.profile.asachkov.internal
fi

