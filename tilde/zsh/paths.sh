# Homebrew must be first in PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH

# scripts from this repo
export PATH=~/.bin:$PATH

# Added local bin to path for binstubs
export PATH=~/bin:$PATH
# git-safe bin, see https://thoughtbot.com/blog/git-safe
export PATH=.git/safe/../../bin:$PATH

# AVM stuff :)
export PATH=~/.cargo/bin:$PATH
export PATH=~/.avm/node/bin:~/.avm/ruby/bin:$PATH

export GOPATH=~/go
export GOBIN=~/go/bin
export PATH=~/go/bin:$PATH
export PATH=/usr/local/go/bin/:$PATH

export PATH=$HOME/.yarn/bin:$PATH

export PATH=~/.local/bin:$PATH

if [ -d "$HOME/.fzf/bin" ]; then
  export PATH="$PATH:$HOME/.fzf/bin"
fi

# added python paths
export PATH=~/Library/Python/2.7/bin:$PATH
