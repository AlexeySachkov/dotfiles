
export LC_ALL=en_US.utf8

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/*\(.*\)/($(tput setaf 11)\1$(tput sgr0) )/"
}

export TERM=xterm-256color
export PS1="\[$(tput setaf 9)\]\u\[$(tput sgr0)\]@\[$(tput setaf 12)\]\h\[$(tput sgr0)\]:[ \[$(tput setaf 34)\]\w\[$(tput sgr0)\] ] \$(parse_git_branch)\n\\$ \[$(tput sgr0)\]"
shopt -s checkwinsize
stty erase "^?"

if [ -r $HOME/.aliases ]; then
  . $HOME/.aliases
fi
