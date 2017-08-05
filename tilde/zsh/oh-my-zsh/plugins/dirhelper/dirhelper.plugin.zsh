# Fix for the c and h commands. These shouldn't get zsh correction
alias c='nocorrect c'
alias h='nocorrect h'
alias w='nocorrect w'

c() {
 cd ~/code/$1;
}

h() {
  cd ~/$1;
}

w() {
  cd ~/wooga/$1;
}
