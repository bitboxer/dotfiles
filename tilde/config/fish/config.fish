# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme bitboxer

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

set fish_plugins node rbenv jump extract rbenv code metamorph bitcrowd

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish cofiguration.
. $fish_path/oh-my-fish.fish

# Homebrew must be first in PATH
set PATH /usr/local/sbin $PATH
set PATH /usr/local/bin $PATH

# Added local bin to path for binstubs
set PATH $PATH ~/bin
set PATH ./bin $PATH

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

# Manuals for Ruby People (thanks @moonglum)
alias man="gem man -s"

# Use siver searcher, it is faster!
alias ack="ag -S"
alias ag="ag -S"

function fish_greeting
  cat ~/.logo/joker.ascii
end

function fish_title
  if test $_  != fish
    echo $_ ' '
  end
  pwd
end

# GRC add color the output (thanks to @klaustopher)
set GRC (which grc)
alias colourify="$GRC -es --colour=auto"
alias configure='colourify ./configure'
alias diff='colourify diff'
alias make='colourify make'
alias gcc='colourify gcc'
alias g++='colourify g++'
alias as='colourify as'
alias gas='colourify gas'
alias ld='colourify ld'
alias netstat='colourify netstat'
alias ping='colourify ping'
alias traceroute='colourify /usr/sbin/traceroute'

