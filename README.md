# Bodo Tasche Dot Files #

These are config files to set up a system the way I like it. This was a
fork of  [dotfiles](http://github.com/ryanb/dotfiles) by [Ryan Bates](http://railscasts.com/)
but this is no longer the case.

Currently it is using the [exogenesis](http://github.com/moonglum/exogenesis) gem
to manage the installation process.

## Installation ##

    bundle
    bundle exec rake install

This will link the settings and install my branch of [oh-my-zsh](https://github.com/bitboxer/oh-my-zsh).

If you want to use the vim config, you need to install [janus](https://github.com/carlhuda/janus).

## ZSH ##

I am running on Mac OS X, but it will likely work on Linux as well with 
minor fiddling. I primarily use zsh. If you would like to switch to zsh, 
you can do so with the following command.

    chsh -s /bin/zsh

## Vim config ##

Since 2011-04-25 I am using [janus](https://github.com/carlhuda/janus)
as my vim package manager. I only added a few tweaks and changed a few
defaults.

The vim config uses janus and an slightly modified version of the Inconsolata font. 
The changes in the font are necessary for the powerline gem. You can find the font 
in the font directory.

As additional vim plugins i am currently using

* BufOnly.vim  
* gundo.vim
* vim-powerline
* vim-ragtag

Those plugins have to be installed in .janus if you want to use them, too.

## GIT ##

I added my Git config as example file. Just rename the
.gitconfig_example to .gitconfig and change the Email and Username to
yours.
