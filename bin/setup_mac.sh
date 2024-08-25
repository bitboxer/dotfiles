#!/bin/bash

if [[ ! "$OSTYPE" =~ ^darwin ]]; then
  echo "This can only be run on a mac"
  exit 1
fi

brew tap homebrew/cask

brews=(
  ansible
  tmux
  wifi-password
  tig
  topgrade
  git-delta
  lima
  difftastic
  antidote
  lazygit
)

brew analytics off

brew install "${brews[@]}"

apps=(
  iterm2
  qlcolorcode
  qlimagesize
  qlmarkdown
  qlprettypatch
  qlstephen
  quicklook-csv
  quicklook-json
  webpquicklook
  flux
  google-chrome
  slack
  spotify
  virtualbox
  vlc
)

brew cask install "${apps[@]}"

bash <(curl https://raw.githubusercontent.com/ellie/atuin/main/install.sh)
atuin import auto
