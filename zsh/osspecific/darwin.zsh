alias ls="ls -FG"
alias oa='open -a' # App Launcher

export EDITOR='mate -w'

export PATH="~/bin:/opt/local/bin/:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

export M2_HOME=/usr/local/apache-maven
export M2=$M2_HOME/bin
export PATH=$M2:$PATH

export JDK_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home

export LDFLAGS=-L/opt/local/lib
export CFLAGS=-I/opt/local/include

if [[ -s /Users/bodo/.rvm/scripts/rvm ]] ; then source /Users/bodo/.rvm/scripts/rvm ; fi
