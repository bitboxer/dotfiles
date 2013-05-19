# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme bitboxer

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

set fish_plugins rbenv code

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish cofiguration.
. $fish_path/oh-my-fish.fish

# Homebrew must be first in PATH
set PATH /usr/local/sbin $PATH
set PATH /usr/local/bin $PATH

# RBenv via homebrew
set PATH $PATH /usr/local/opt/rbenv/shims
set PATH $PATH /usr/local/opt/rbenv/bin
set PATH $PATH /usr/local/share/npm/bin

# ls
alias la='ls -A'

# git
alias gs='git status'
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'
alias gd='git diff'
alias glog='git log'
alias gca='git commit -v -a'
alias gl='git pull'
alias gp='git push'
alias gco='git checkout'

# Respect ANSI Color Strings
alias less="less -R"

# Trees should have colors
alias tree="tree -C"

# Start pry for rails console debugging
alias pryc='pry -I . -rconfig/environment'

# Rails aliases
alias trst="touch tmp/restart"
alias tlog="tail -f log/development.log"

# Bundler
alias be="bundle exec"

function fish_greeting
  cat ~/.logo/joker.ascii
end

function fish_title
  if test $_  != fish
    echo $_ ' '
  end
  pwd
end
