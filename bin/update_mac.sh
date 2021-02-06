#!/bin/sh

brew update
brew upgrade
brew cleanup

./update_git_completion.sh

nvim +PlugUpdate +UpdateRemotePlugins +qa

asdf update
asdf plugin update --all
