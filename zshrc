. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/local_aliases
. ~/.zsh/completion

bindkey "^[[3~" delete-char

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc
