# Serve local dir via http
alias http='ruby -run -e httpd . -p 5000'

# Start pry for rails console debugging
alias pryc='pry -I . -rconfig/environment'

# Rails aliases
alias trst="touch tmp/restart"
alias tlog="tail -f log/development.log"

# Bundler
alias be="bundle exec"
alias bi="bundle install"

# Use siver searcher, it is faster!
alias ack="ag -S"
alias ag="ag -S"

alias j="jump"

alias vim="nvim"
alias vi="nvim"

to() {
  if [[ "$#" > 0 ]]; then
    gittower $@
  else
    gittower `git rev-parse --show-toplevel`
  fi
}
alias gitx='echo "Use tower!!!" && to'

# git
alias gs='git status'
alias gd='git diff'
alias glog='git log'
alias gca='git commit -v -a'
# Till this (https://github.com/aanand/git-up/issues/114) is fixed, i keep using git pull :(
alias gl='git pull'
alias gp='git push'
alias gpb='git push --set-upstream origin HEAD' # Push local branch to remote
alias gco='git checkout'
alias gcb='git checkout -b'

alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'

alias rb="git rebase $@"
alias rbm="git rebase master -i"
alias rbc="git rebase --continue"
alias rba="git rebase --abort"

alias git="hub"

tmuxssh() { autossh -M 0 -t $@ 'tmux attach || tmux new' }

# These tools need admin permission to work
alias htop="sudo htop"
alias mtr="sudo mtr $@"
