#!/bin/sh

brew update
brew upgrade

nvim +PlugUpdate +qa
