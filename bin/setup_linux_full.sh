#!/bin/sh

echo ""
echo "-> Setting up ✨ ALL THE THINGS ✨"
echo ""

base_dir="$(dirname "$0")"

sh "$base_dir/setup_linux_min.sh"

sudo add-apt-repository -y ppa:yt-dlp/stable 
sudo apt update
sudo apt install -y postgresql ffmpeg jq yt-dlp


# Install:
# - yarn
# - node
# - ruby
# - bundler
# - elixir

# - command: /bin/zsh -c 'source /home/vagrant/.asdf/asdf.sh && cd ~/ && npm set init-author-name "{{ user_name }}"'
# - command: /bin/zsh -c 'source /home/vagrant/.asdf/asdf.sh && cd ~/ && npm set init-author-email"{{ email }}"'
# - command: /bin/zsh -c 'source /home/vagrant/.asdf/asdf.sh && cd ~/ && npm set init-author-url "{{ url }}"'
