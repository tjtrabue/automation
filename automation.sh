#!/bin/env bash

# Where all the good stuff goes down.

# Get the user's permission up front, and maintain it throughout the
# installation process:
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if [[ ! -d ~/.automation ]]; then
    source ./init/install_homebrew.sh
    source ./dotfiles/bootstrap.sh
    source ./dotfiles/brew.sh
    source ./init/applications.sh
    source ./init/environment.sh
else
    source ./update/update.sh
fi