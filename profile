
export LC_ALL=en_US.utf8
export TERM=xterm-256color
shopt -s checkwinsize
stty erase "^?"

reset_colors() {
  tput sgr0
}

font_color() {
  tput setaf $1
}

bg_color() {
  tput setab $1
}

ps1_reset_colors() {
  echo "\[$(tput sgr0)\]"
}

ps1_font_color() {
  echo "\[$(tput setaf $1)\]"
}

ps1_bg_color() {
  echo "\[$(tput setab $1)\]"
}

parse_git_branch() {
  local reset_colors=$(reset_colors)
  local yellow_font=$(font_color 11)
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/*\(.*\)/(${yellow_font}\1${reset_colors} )/"
}

build_ps_one() {
  local reset_colors=$(ps1_reset_colors)
  local green_font=$(ps1_font_color 2)
  local red_font=$(ps1_font_color 9)
  local cyan_font=$(ps1_font_color 12)
  local yellow_font=$(ps1_font_color 11)
  local username="${red_font}\u${reset_colors}"
  local hostname="${cyan_font}\h${reset_colors}"
  local cwd="${green_font}\w${reset_colors}"
  local git_branch="\$(parse_git_branch)"

  echo "${username}@${hostname}:[ ${cwd} ] ${git_branch} ${1}\n\\$ "
}

export PS1=$(build_ps_one)

if [ -r $HOME/.aliases ]; then
  . $HOME/.aliases
fi

if [ -r $HOME/.profile.asachkov.internal ]; then
  . $HOME/.profile.asachkov.internal
fi
