#!/bin/bash

# INIT =========================================================================

github_url="https://github.com/andrewboy/termux-yt-dl/raw/main"
bin_path="$HOME/bin"
file_name="termux-url-opener"

# Update packages
yes | pkg update && pkg upgrade

# TERMUX URL OPENER ============================================================

#Install dependencies
pkg install curl python python-pip ffmpeg dialog -y
yes | pip install -U yt-dlp

#Install script
mkdir -p $bin_path

#Install script
if ! [ -f $file_name ];
then
    curl -sSL -O --output-dir $bin_path $github_url/$file_name
else
    cp $file_name $bin_path
fi

chmod +x "$bin_path/$file_name"
termux-setup-storage
