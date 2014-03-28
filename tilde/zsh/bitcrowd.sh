alias b='nocorrect b'

b() {
 cd ~/bitcrowd/$1;
}

_b() {
  _files -W ~/bitcrowd -/
}

compdef _b b
