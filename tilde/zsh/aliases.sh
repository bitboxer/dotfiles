#!/bin/bash
# Serve local dir via http
alias servethis='ruby -run -e httpd . -p 4000'

# Start pry for rails console debugging
alias pryc='pry -I . -rconfig/environment'

# Rails aliases
alias trst="touch tmp/restart"
alias tlog="tail -f log/development.log"

# Bundler
be() {
  if [ -f "bin/$1" ]; then
    cmd="$1"
    shift
    "bin/$cmd" "$@"
  else
    bundle exec "$@"
  fi
}

alias bi="bundle install"
alias ber="bundle exec rake"

# Use ripgrep, it is faster!
alias ack="rg -S"
alias ag="rg -S"

alias j="jump"

alias vim="nvim"
alias vi="nvim"

# git
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdl='git log HEAD^..HEAD && git diff HEAD^..HEAD'
alias glog='git log'
alias ga='git add'
alias gc='git commit'
alias gca='git commit -v -a -S'
alias gcaa='git commit -v -a --amend'
alias gl='git pull'
alias glr='git pull --rebase'
alias gp='git push'
alias gpf='git pf'
alias gpb='git push --set-upstream origin HEAD' # Push local branch to remote
gpr() {
  git push --set-upstream origin HEAD && open-pr "$*" # Push local branch to remote
}
gu() {
  git fetch origin "$1":"$1" # Update branch without checking it out
}
alias gpbf='git pf --set-upstream origin HEAD' # Push local branch to remote and force it
alias gco='echo "use gsw!"; gsw'
alias gcb='echo "use gswc!"; gswc'
alias gsw='git switch'
alias gswc='git switch -c'
alias glc='git log -1 --pretty=%B | tr -d "\n" | pbcopy' # Last git commit message to clipboard
alias ghpr="gh pr create --fill"
alias gst='git stash -u' # stash all files, even untracked ones
alias redocommit='git commit -m "$(cat "$(git rev-parse --git-dir)/COMMIT_EDITMSG)")"'

alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'

rb() {
  git rebase --autostash "$@"
}

alias rbc="git rebase --continue"
alias rba="git rebase --abort"

gswm() {
  if [[ $(git branch --list master) ]]; then
      echo '*********************************************';
      echo '* Consider renaming master branch to main ! *';
      echo '*********************************************';
      git switch master
  elif [[ $(git branch --list main) ]]; then
      git switch main
  else
      git switch develop
  fi
}

rbm() {
  if [[ $(git branch --list master) ]]; then
      echo '*********************************************';
      echo '* Consider renaming master branch to main ! *';
      echo '*********************************************';
      git rebase master -i --autostash
  elif [[ $(git branch --list main) ]]; then
      git rebase main -i --autostash
  else
      git rebase develop -i --autostash
  fi
}

# Use a function to keep git auto completions
git() { 
  hub "$@"
}

# docker
docker_stop_all() { 
  docker stop "$(docker ps -aq)"
}
alias docker-cleanup="docker-stop-all && docker system prune --volumes -a"

tmuxssh() { 
  autossh -M 0 -t "$@" 'tmux -CC new-session -A -s main' 
}

# These tools need admin permission to work
alias htop="sudo htop"

alias m="make"

alias im="iex -S mix"

shell() {
  cd ~/code/dotfiles || exit
  if [[ ! -d "$HOME/.lima/box" ]]; then
    echo "Lima box does not exist, creating it..."
    limactl start box.yml
  elif [[ ! $(limactl ls box) == *'Running'* ]]; then
    echo "Lima box is not running, starting it..."
    limactl disk unlock persistant
    limactl start box
  fi

  if [[ $(uname -a) =~ 'Linux' ]]; then
    limactl shell --workdir="/home/$USER.linux" --shell="/usr/bin/zsh" box SHELL=/usr/bin/zsh tmux new-session -A -s main
  fi
  if [[ $(uname -a) =~ 'Darwin' ]]; then
    limactl shell --workdir="/home/$USER.linux" --shell="/usr/bin/zsh" box SHELL=/usr/bin/zsh tmux -CC new-session -A -s main
  fi
}

alias ls="exa --git"
alias cop="git add -N .; git diff --name-only | xargs bundle exec rubocop --fix"
