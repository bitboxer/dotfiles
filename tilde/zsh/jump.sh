# Jump

# Inspired by the Oh-My-ZSH Jump Plugin
export MARKPATH=$HOME/.marks

alias j=jump
# jump FOO: jump to a mark named FOO
jump() { cd -P "$MARKPATH/$1" }
_jump() { _files -W "$MARKPATH/$1" }
compdef _jump jump

# mark FOO: create a mark named FOO
mark() { mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1" }

# unmark FOO: delete a mark
unmark() { rm -i "$MARKPATH/$1" }

# marks: lists all marks (see: functions)
