# RVM-Integration must be done in zshenv for vim
# http://beginrescueend.com/integration/vim/

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

case `uname` in
  Darwin*)
    source ~/.dotfiles/zsh/osspecific/darwin.zsh
    ;;
  *)
    source ~/.dotfiles/zsh/osspecific/linux.zsh
    ;;;
esac
