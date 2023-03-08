#!/bin/bash

message() {
  echo ""
  echo "=> ${1}"
  echo ""
}

message "Setting up ✨ ALL THE THINGS ✨"

base_dir="$(dirname "$0")"

"$base_dir/setup_linux_min.sh"

sudo add-apt-repository -y ppa:yt-dlp/stable 
sudo apt update
sudo apt install -y tmux postgresql ffmpeg jq yt-dlp gh python3 python3-pip libyaml-dev

/home/linuxbrew/.linuxbrew/bin/brew install topgrade neovim

if [[ ! -d "$HOME/.tmux-yank" ]]; then
  message "Installing tmux-yank"
  git clone https://github.com/tmux-plugins/tmux-yank.git "$HOME/.tmux-yank"
else
  message "tmux-yank already installed, updating"
  (cd "$HOME/.tmux-yank" && git pull)
fi

message "Installing neovim"
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.cache/nvim/"
./tilde/bin/ilns "$(readlink -e "$base_dir"/../tilde/nvim/init.vim)"  "$HOME/.config/nvim/init.vim"

if [ ! -e "$HOME/.config/nvim/autoload/plug.vim" ]; then
  message "Installing vim-plug"
  curl -fLo "$HOME/.config/nvim/autoload/plug.vim" --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
pip3 install neovim
nvim +PlugInstall +UpdateRemotePlugin +qA

/bin/zsh -c 'source $HOME/.asdf/asdf.sh && asdf install nodejs 18.14.0'
/bin/zsh -c 'source $HOME/.asdf/asdf.sh && asdf install erlang 25.2'
/bin/zsh -c 'source $HOME/.asdf/asdf.sh && asdf install elixir 1.14'
/bin/zsh -c 'source $HOME/.asdf/asdf.sh && asdf install ruby 3.2.1'

{ 
  echo erlang 25.2
  echo elixir 1.14
  echo ruby 3.2.1
  echo nodejs 18.14.0
} >> ~/.tool-versions

/bin/zsh -c 'source $HOME/.asdf/asdf.sh && asdf reshim'
/bin/zsh -c 'source $HOME/.asdf/asdf.sh && npm install -g yarn'
/bin/zsh -c 'source $HOME/.asdf/asdf.sh && gem install bundler'
