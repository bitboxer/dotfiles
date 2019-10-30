# Trees should have colors
alias tree="tree -C"

# Respect ANSI Color Strings
alias less="less -R"

# And now to colourify...

if [ -x "$(command -v grc)" ]; then
  # GRC add color the output (thanks to @klaustopher)
  export GRC=`which grc`

  colourify() {
    $GRC -es --colour=auto "$@"
  }

  configure() {
    colourify ./configure "$@"
  }
  
  diff() {
    colourify diff "$@"
  }

  make () {
    colourify make "$@"
  }
  gcc() {
    colourify gcc "$@"
  }
  g++() {
    colourify g++ "$@"
  }
  as() {
    colourify as "$@"
  }
  gas() {
    colourify gas "$@"
  }
  ld() {
    colourify ld "$@"
  }
  netstat() {
    colourify netstat "$@"
  }
  ping() {
    colourify ping "$@"
  }
  traceroute() {
    colourify /usr/sbin/traceroute "$@"
  }
fi
