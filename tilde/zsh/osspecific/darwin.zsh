alias ls="ls -FG"
alias oa='open -a' # App Launcher

export EDITOR='vim'

export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

export JDK_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home

# Use brew readline to compile ruby. Enables umlaute in IRB
export RUBY_CONFIGURE_OPTS=--with-readline-dir=/usr/local/opt/readline
