#!/bin/bash

# INIT =========================================================================

fetch_cp() {
    local github_url = $1
    local src = $2
    local dest = $3

    if ! [ -f $src ];
    then
        curl -sSL -O --output-dir $dest $github_url/$src
    else
        cp $src $dest
    fi
}

github_url="https://github.com/andrewboy/termux-yt-dl/raw/main"
bin_path="$HOME/bin"
file_name="termux-url-opener"

# Update packages
yes | pkg update && \
yes | pkg upgrade

# TERMUX URL OPENER ============================================================

#Install dependencies
pkg install curl python python-pip ffmpeg dialog -y
yes | pip install -U yt-dlp

#Install script
mkdir -p $bin_path

#Install script
fetch_cp $github_url $file_name $bin_path

chmod +x "$bin_path/$file_name"
termux-setup-storage
