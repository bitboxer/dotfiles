if [[ $OSTYPE == darwin* ]]; then
    source ~/.dotfiles/zsh/osspecific/darwin.zsh
  else
    source ~/.dotfiles/zsh/osspecific/linux.zsh
fi
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
