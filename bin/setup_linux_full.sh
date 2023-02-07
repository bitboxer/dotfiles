#!/bin/bash

echo ""
echo "-> Setting up ✨ ALL THE THINGS ✨"
echo ""

base_dir="$(dirname "$0")"

sh "$base_dir/setup_linux_min.sh"

sudo add-apt-repository -y ppa:yt-dlp/stable 
sudo apt update
sudo apt install -y postgresql ffmpeg jq yt-dlp gh

brew install tmux topgrade

if [[ ! -d "$HOME/.tmux-yank" ]]; then
  message "Installing tmux-yank"
  git clone https://github.com/tmux-plugins/tmux-yank.git "$HOME/.tmux-yank"
else
  message "tmux-yank already installed, updating"
  (cd "$HOME/.tmux-yank" && git pull)
fi

# Install:
# - yarn
# - node
# - ruby
# - bundler
# - elixir
# - neovim

# TODO: set editor to nvim only if nvim is present

# - command: /bin/zsh -c 'source /home/vagrant/.asdf/asdf.sh && cd ~/ && npm set init-author-name "{{ user_name }}"'
# - command: /bin/zsh -c 'source /home/vagrant/.asdf/asdf.sh && cd ~/ && npm set init-author-email"{{ email }}"'
# - command: /bin/zsh -c 'source /home/vagrant/.asdf/asdf.sh && cd ~/ && npm set init-author-url "{{ url }}"'
