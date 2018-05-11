
# PS1 helpers

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

build_ls_colors() {
  local cyan_font="38;5;12"
  echo "di=${cyan_font}"
}

# Functions to deal with PATH-like env variables
# From https://stackoverflow.com/a/24522107/4983627

# SYNOPSIS: field_prepend varName fieldVal [sep]
#   SEP defaults to ':'
# Note: Forces fieldVal into the first position, if already present.
#       Duplicates are removed, too.
# EXAMPLE: field_prepend PATH /usr/local/bin
field_prepend() {
    local varName=$1 fieldVal=$2 IFS=${3:-':'} auxArr
    read -ra auxArr <<< "${!varName}"
    for i in "${!auxArr[@]}"; do
        [[ ${auxArr[i]} == "$fieldVal" ]] && unset auxArr[i]
    done
    auxArr=("$fieldVal" "${auxArr[@]}")
    printf -v "$varName" '%s' "${auxArr[*]}"
}

# SYNOPSIS: field_append varName fieldVal [sep]
#   SEP defaults to ':'
# Note: Forces fieldVal into the last position, if already present.
#       Duplicates are removed, too.
# EXAMPLE: field_append PATH /usr/local/bin
field_append() {
    local varName=$1 fieldVal=$2 IFS=${3:-':'} auxArr
    read -ra auxArr <<< "${!varName}"
    for i in "${!auxArr[@]}"; do
        [[ ${auxArr[i]} == "$fieldVal" ]] && unset auxArr[i]
    done
    auxArr+=("$fieldVal")
    printf -v "$varName" '%s' "${auxArr[*]}"
}

# SYNOPSIS: field_remove varName fieldVal [sep]
#   SEP defaults to ':'
# Note: Duplicates are removed, too.
# EXAMPLE: field_remove PATH /usr/local/bin
field_remove() {
    local varName=$1 fieldVal=$2 IFS=${3:-':'} auxArr
    read -ra auxArr <<< "${!varName}"
    for i in "${!auxArr[@]}"; do
        [[ ${auxArr[i]} == "$fieldVal" ]] && unset auxArr[i]
    done
    printf -v "$varName" '%s' "${auxArr[*]}"
}
