. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/local_aliases
. ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc
