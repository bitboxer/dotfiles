# Trees should have colors
alias tree="tree -C"

# Respect ANSI Color Strings
alias less="less -R"

# And now to colourify...

if [ -x "$(command -v grc)" ]; then
  # GRC add color the output (thanks to @klaustopher)
  export GRC=`which grc`

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
fi
