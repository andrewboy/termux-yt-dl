#!/bin/bash

# INIT =========================================================================

termux_root="/data/data/com.termux/files"

# Update packages
yes | pkg update && pkg upgrade

# TERMUX URL OPENER ============================================================

#Install dependencies
pkg install python python-pip ffmpeg dialog -y
yes | pip install yt-dlp

#Install script
mkdir -p $HOME/bin && cp termux-url-opener $_/
chmod +x "$HOME/bin/termux-url-opener"
termux-setup-storage
