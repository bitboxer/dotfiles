# My dotfiles #

This is my dotfiles repo with all the things I need for my day to day work. I
am developing inside of a vagrant box that is provisioned via ansible. Start it
via `vagrant up && vagrant ssh`. From time to time I will do a `vagrant
destroy` to have a clean machine.

There is lot of things configured and installed into that vagrant box. For
details you can look into the [ansible playbook](ansible/playbook.yml) and
the configuration of all the tools inside of the [tilde](tilde) directory.

For my day to day work I am using tmux and neovim together with lots of other
tools and programming languages. I write code mostly in Elixir, Ruby and
Javascript and have the tooling optimized for that.

I have no developer tools installed on my mac, but added a couple of
apps on my mac to make it my ideal working machine. Most of them can be
found [in this article](https://thesweetsetup.com/bodo-tasches-mac-iphone-setup/).

## Clipboard ##

To have a clipboard that is shared with the terminal session in my vagrant box
I am using the X11 protocol. Details for this can be found in [this blogpost](https://bitboxer.de/2017/08/06/ssh-with-clipboard/).

## Keyboard ##

I have modified my keyboard a bit for my needs.

* I am using a [custom german keyboard layout](http://bitboxer.de/2012/05/21/german-coding-keyboard-layout-for-macs/)
  with [ ] on the ö and ä keys.
* A [karabiner-elements](https://github.com/tekezo/Karabiner-Elements)
  [config](tilde/config/karabiner/karabiner.json) that
  * maps Caps Lock to Escape on short presses and Ctrl on long presses
  * maps left Ctrl to a hyper key meaning it functions as a combination of
    Ctrl+Alt+Cmd. This enables another layer for shortcuts.

## Persistant storage

Vagrant boxes can be thrown away. Everything that I don't want to reinstall
after I rebuild the box is in another disk image. I am using the
[vagrant-persistant-storage](vagrant plugin install vagrant-persistent-storage)
plugin for this.

Install it via

```
$ vagrant plugin install vagrant-persistent-storage
```

## Thanks ##

Most of this config is copied and/or inspired by others. Some of
them are:

* [Ryan Bates](https://github.com/ryanb)
* [Lucas Dohmen](https://github.com/moonglum/dotfiles)
* [Dirk Breuer](https://github.com/railsbros-dirk)

… and many more. Thanks to you all for your input and help!
