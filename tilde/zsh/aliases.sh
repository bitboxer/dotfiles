# Serve local dir via http
alias servethis='ruby -run -e httpd . -p 5000'

# Start pry for rails console debugging
alias pryc='pry -I . -rconfig/environment'

# Rails aliases
alias trst="touch tmp/restart"
alias tlog="tail -f log/development.log"

# Bundler
alias be="bundle exec"
alias bi="bundle install"
alias ber="bundle exec rake"

# Use ripgrep, it is faster!
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
alias gco='echo "use gsw!"; gsw'
alias gcb='echo "use gswc!"; gswc'
alias gsw='git switch'
alias gswc='git switch -c'
alias glc='git log -1 --pretty=%B | tr -d "\n" | pbcopy' # Last git commit message to clipboard
alias ghpr="gh pr create --fill"

alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'

alias rb="git rebase --autostash $@"
alias rbc="git rebase --continue"
alias rba="git rebase --abort"

rbm() {
  if [[ $(git branch --list master) ]]; then
      echo '*********************************************';
      echo '* Consider renaming master branch to main ! *';
      echo '*********************************************';
      git rebase master -i --autostash
  else
      git rebase main -i --autostash
  fi
}

# Use a function to keep git auto completions
git() {hub $@}

# docker
docker_stop_all() { docker stop $(docker ps -aq) }
alias docker-cleanup="docker-stop-all && docker system prune --volumes -a"

tmuxssh() { autossh -M 0 -t $@ 'tmux -CC new-session -A -s main' }

# These tools need admin permission to work
alias htop="sudo htop"
alias mtr="sudo mtr $@"

alias m="make"

alias im="iex -S mix"

shell() {
  cd ~/code/dotfiles
  vagrant_status=$(vagrant status)
  if [[ ! $vagrant_status =~ 'running' ]]; then
    vagrant up
  fi
  if [[ $(uname -a) =~ 'Linux' ]]; then
    vagrant ssh -c "tmux new-session -A -s main"
  fi
  if [[ $(uname -a) =~ 'Darwin' ]]; then
    vagrant ssh -c "tmux -CC new-session -A -s main"
  fi
}

if [ -x "$(command -v xdg-open)" ]; then
  alias open="xdg-open"
fi

alias ls="exa --git"
