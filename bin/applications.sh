#!/usr/bin/env bash

# Install development apps and platforms using Homebrew

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# First, install OS X commandline tools if they aren't already installed:
xcode-select –install

# Install Homebrew if it isn't already installed:
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Brew Cask:
brew install caskroom/cask/brew-cask
brew tap caskroom/cask

# Install Sublime Text:
brew cask install sublime-text3

# Install IntelliJ IDEA:
brew cask install intellij-idea

# Install iTerm2:
brew cask install iterm2

# Install Groovy:
brew install groovy

# Remove outdated versions from the cellar.
brew cleanup