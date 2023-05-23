#!/bin/bash

message() {
  echo ""
  echo "=> ${1}"
  echo ""
}

message "Linking dotfiles"

"$(dirname "$0")/../tilde/bin/link-dotfiles" "$(dirname "$0")"/../tilde

message "Installing apt packages"

sudo apt-get update
sudo apt-get install -y autoconf automake \
       build-essential cmake curl dirmngr \
       g++ gettext git git-crypt gnupg-agent \
       gnupg2 gpg grc htop inotify-tools libevent-dev \
       libncurses5-dev libtool libtool-bin meld \
       pkg-config pwgen software-properties-common \
       tig tree unzip wget autossh zsh imagemagick \
       locales-all libssl-dev < "/dev/null"

touch "$HOME/.zsh_history"

if [[ -d "$HOME/.oh-my-zsh" ]]; then
  message "oh-my-zsh already installed, updating"
  (cd "$HOME/.oh-my-zsh" && git pull)
else
  message "Installing oh-my-zsh"
  git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"
fi

message "Install zsh-syntax-highlighting"

if [[ -d "$HOME/.zsh-syntax-highlighting" ]]; then
  message "zsh-syntax-highlighting already installed, updating"
  (cd "$HOME/.zsh-syntax-highlighting" && git pull)
else
  message "Installing zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting"
fi

if [[ ! -f "/usr/local/bin/antibody" ]]; then
  message "Installing antibody"
  sudo sh -c "curl -sfL git.io/antibody | sh -s - -b /usr/local/bin"
else
  message "antibody already installed"
fi

if [[ ! -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
  message "Installing homebrew"
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  message "linuxbrew already installed"
fi
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

message "Install Homebrew packages"
brew install git-delta exa ripgrep hub bat

message "Set the timezone"
sudo sh -c "timedatectl set-timezone Europe/Berlin"

message "Setting the default shell to zsh"
sudo usermod --shell /bin/zsh bitboxer

message "Install asdf"

if [[ -d "$HOME/.asdf" ]]; then
  message "asdf already installed, updating"
  (cd "$HOME/.asdf" && git fetch && git checkout "$(git describe --abbrev=0 --tags)")
else
  message "Installing asdf"
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  (cd "$HOME/.asdf" && git checkout "$(git describe --abbrev=0 --tags)")
fi

message "Install asdf plugins"

~/.asdf/bin/asdf plugin-add erlang http://github.com/asdf-vm/asdf-erlang
~/.asdf/bin/asdf plugin-add elixir http://github.com/asdf-vm/asdf-elixir
~/.asdf/bin/asdf plugin-add ruby http://github.com/asdf-vm/asdf-ruby
~/.asdf/bin/asdf plugin-add nodejs http://github.com/asdf-vm/asdf-nodejs
~/.asdf/bin/asdf plugin-add golang http://github.com/kennyp/asdf-golang
~/.asdf/bin/asdf plugin-add rust http://github.com/code-lever/asdf-rust
~/.asdf/bin/asdf plugin-add terraform https://github.com/Banno/asdf-hashicorp
~/.asdf/bin/asdf reshim

message "Installing fzf"

if [[ -d "$HOME/.fzf" ]]; then
  message "fzf already installed, updating"
  (cd "$HOME/.fzf" && git pull)
else
  message "Installing fzf"
  git clone https://github.com/junegunn/fzf.git ~/.fzf
  /bin/zsh -c 'source ~/.asdf/asdf.sh && ~/.fzf/install --all --no-update-rc --no-bash --no-fish'
fi

if ! [ -x "$(command -v atuin)" ]; then
  bash <(curl https://raw.githubusercontent.com/ellie/atuin/main/install.sh)
  atuin import auto
fi

touch ~/.secrets
