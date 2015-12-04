function truncated_git_prompt() {
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    if (( ${#ref} > 40 )); then
      ref="${ref[0,40]}…"
    fi
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

if [[ -n $SSH_CONNECTION ]]; then
  export PS1='%n@%m:%F{green}%~%f$(truncated_git_prompt)%F{blue}> '
else
  export PS1='%F{green}%~%f$(truncated_git_prompt)%F{blue}> '
fi

ZSH_THEME_GIT_PROMPT_PREFIX="[%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f]"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}*%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""
