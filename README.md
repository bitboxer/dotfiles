# Bodo Tasche Dot Files #

These are config files to set up a system the way I like it. This was a
fork of  [dotfiles](http://github.com/ryanb/dotfiles) by [Ryan Bates](http://railscasts.com/)
but this is no longer the case.

Currently it is using the [exogenesis](http://github.com/moonglum/exogenesis) gem
to manage the installation process.

## Installation ##

    bundle
    bundle exec rake install

This will install all needed packages and links my config files to ``$HOME``.

## Fish##

Currently I am running an experiment in using [Fish](http://fishshell.com).
Don't know If I will keep it, but right now it feels really great.

I am using a forked version of [oh-my-fish](https://github.com/bitboxer/oh-my-fish)
as setup.

## ZSH ##

I am running on Mac OS X, but it will likely work on Linux as well with 
minor fiddling. I primarily use zsh. If you would like to switch to zsh, 
you can do so with the following command.

    chsh -s /bin/zsh

I am using a forked version of [oh-my-zsh](https://github.com/bitboxer/oh-my-zsh)
as setup.

## Vim config ##

I am using [vundle](https://github.com/gmarik/vundle) to organize my plugins. Vundle
is installed via exogenesis.

## GIT ##

I added my Git config as example file. Just rename the
``.gitconfig_example`` to ``.gitconfig`` and change the Email and Username to
yours.
