#!/bin/env bash

# Install xCode commandline tools if they do not already exist:
if [[ `"xcode-select -p"` == 2 ]]; then
	xcode-select --install
fi

# Check to see if Homebrew is installed
# if not, install it along with Cask;
# if so, update Brew;
which -s brew
if [[ $? != 0 ]] ; then
    ruby -e “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)”

    brew doctor

    brew install caskroom/cask/brew-cask
else
    brew update
fi