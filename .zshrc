source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls='ls -a --color=auto -hF'

# Draw a full-width horizontal line before each prompt
draw_line() {
  local line
  line=$(printf '%*s' "$COLUMNS" '')
  print
  print -P "%F{#585b70}${line// /─}%f"
}

# Determines if prompt was empty
typeset -g __DREW_COMMAND=0

# Init git status in prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '!'
# zstyle ':vcs_info:git:*' actionformats '(%b|%a|%u%c)'
zstyle ':vcs_info:git:*' formats ' │ %b %u%c'

zstyle ':vcs_info:*' check-for-changes true

preexec() {
  [[ -n "$1" ]] || return
  __DREW_COMMAND=1
}
precmd() {
  local ret=$?
  vcs_info
  if (( __DREW_COMMAND )) && [[ $ret -eq 0 ]]; then
    draw_line
  fi
  __DREW_COMMAND=0
}

setopt prompt_subst

RPROMPT='%F{#9399b2}%D{%H:%M}%f'
PROMPT='
%(?.%F{#a6e3a1}╭─●%f.%F{#f38ba8}╭─●%f) %F{#89dceb}%~%f%F{#cba6f7}${vcs_info_msg_0_}%f
%(?.%F{#a6e3a1}╰─▶%f.%F{#f38ba8}╰─▶%f) '
