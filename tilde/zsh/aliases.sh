# Serve local dir via http
alias http='ruby -run -e httpd . -p 5000'

# Start pry for rails console debugging
alias pryc='pry -I . -rconfig/environment'

# Rails aliases
alias trst="touch tmp/restart"
alias tlog="tail -f log/development.log"

# Bundler
alias be="bundle exec"

# Use siver searcher, it is faster!
alias ack="ag -S"
alias ag="ag -S"

alias j="jump"

tmuxssh() { autossh -M 0 -t $@ 'tmux attach || tmux new' }
