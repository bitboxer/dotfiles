#!/bin/sh

brew update
brew upgrade
brew cleanup

./update_git_completions.sh

nvim +PlugUpdate +UpdateRemotePlugins +qa
