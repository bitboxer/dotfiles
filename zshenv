# RVM-Integration must be done in zshenv for vim
# http://beginrescueend.com/integration/vim/

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

if [[ $OSTYPE == darwin* ]]; then
    source ~/.dotfiles/zsh/osspecific/darwin.zsh
  else
    source ~/.dotfiles/zsh/osspecific/linux.zsh
fi
