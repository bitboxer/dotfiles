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
alias ber="bundle exec rake"

# Use siver searcher, it is faster!
alias ack="rg -S"
alias ag="rg -S"

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
alias gca='git commit -v -a -S'
alias gl='git pull'
alias gp='git push'
alias gpf='git pf'
alias gpb='git push --set-upstream origin HEAD' # Push local branch to remote
alias gpr='git push --set-upstream origin HEAD && open-pr "$*"' # Push local branch to remote
alias gpbf='git pf --set-upstream origin HEAD' # Push local branch to remote and force it
alias gco='git checkout'
alias gcb='git checkout -b'
alias glc='git log -1 --pretty=%B | tr -d "\n" | pbcopy' # Last git commit message to clipboard

alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'

alias rb="git rebase --autostash $@"
alias rbm="git rebase master -i --autostash"
alias rbc="git rebase --continue"
alias rba="git rebase --abort"

alias git="hub"

tmuxssh() { autossh -M 0 -t $@ 'tmux attach || tmux new' }

# These tools need admin permission to work
alias htop="sudo htop"
alias mtr="sudo mtr $@"
