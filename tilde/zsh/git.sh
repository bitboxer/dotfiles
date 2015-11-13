# git
alias gs='git status'
alias gd='git diff'
alias glog='git log'
alias gca='git commit -v -a'
alias gl='git up'
alias gp='git push'
alias gpb='git push --set-upstream origin HEAD' # Push local branch to remote
alias gco='git checkout'
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'

alias rb="git rebase $@"
alias rbm="git rebase master -i"
alias rbc="git rebase --continue"
alias rba="git rebase --abort"

alias git="hub"
