export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

vimf() {
  local file
  file=$(fzf --query="$1") && vim "$file"
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# fh - repeat history
fh() {
  eval $(history | fzf +s | sed 's/ *[0-9]* *//')
}

# fkill - kill process
fkill() {
  ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9}
}

# fbr - checkout git branch
fbr() {
  local branches
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(then)%(else)%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  target=$(
    echo "$branches" |
    fzf --no-hscroll --no-multi\
        --ansi --preview="git --no-pager log -150 --pretty=format:%s '..{1}'") || return
  git checkout $(awk '{print $2}' <<<"$target" )
}

# fco - checkout git commit
fco() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fe [QUERY]
# - Open the selected file with the default editor
#   (Bypass fuzzy finder when there's only one match)
fe() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0 --preview 'bat --style=numbers --color=always {} | head -500'))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
