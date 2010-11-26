#!/bin/sh
cd ~/.dotfiles
git submodule foreach git checkout master
git submodule foreach git pull
