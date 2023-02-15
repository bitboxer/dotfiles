#!/bin/bash

if [[ ! "$OSTYPE" =~ ^darwin ]]; then
  echo "This can only be run on a mac"
  exit 1
fi

brew tap caskroom/cask
brew tap cantino/mcfly

brews=(
  ansible
  tmux
  wifi-password
  topgrade
  tig
  git-delta
  cantino/mcfly/mcfly
  lima
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
