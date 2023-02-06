#!/bin/sh

echo ""
echo "-> Setting up ✨ ALL THE THINGS ✨"
echo ""

base_dir="$(dirname "$0")"

sh "$base_dir/setup_linux_min.sh"

sudo add-apt-repository -y ppa:yt-dlp/stable 
sudo apt update
sudo apt install -y postgresql ffmpeg jq yt-dlp
