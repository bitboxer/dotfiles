# Serve local dir via http
alias http='ruby -run -e httpd . -p 5000'

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
