# Bodo Tasche Dot Files #

These are config files to set up a system the way I like it. This was a
fork of  [dotfiles](http://github.com/ryanb/dotfiles) by [Ryan Bates](http://railscasts.com/)
but this is no longer the case.

[![badge](http://img.shields.io/badge/%F0%9F%9A%80-Created_with_Exogenesis-be1d77.svg)](https://github.com/moonglum/exogenesis)

## Installation ##

    bundle
    bundle exec rake up

This will install all needed packages and links my config files to ``$HOME``.

## GIT ##

I added my Git config as example file. Just rename the
``.gitconfig_example`` to ``.gitconfig`` and change the Email and Username to
yours.

## And more ... #

There is sadly way to much stuff in this repo to document it all in this
readme. A few keypoints (that might already have been changed since writing this :wink: ) :

* I use zsh with the awesome [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* For neovim I use [vim-plug](https://github.com/junegunn/vim-plug)
* In the [packages.yml](https://github.com/bitboxer/dotfiles/blob/master/packages.yml) you
  will see a nice list of brews, gems and npm packages I am using

And for the rest: just dig through here and copy everything that sounds nice to you.

