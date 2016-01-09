#!/usr/bin/env bash

# Install development apps and platforms using Homebrew

echo "This script will install the following:"
echo "APPLICATIONS"
echo "IntelliJ IDEA, Sublime Text 3, iTerm2,"
echo "DbVisualizer"
echo ""
echo "PLATFORMS:"
echo "Groovy, Python, Perl, PostgresSQL"
echo ""
echo "TOOLS"
echo "xCode command line tools, Homebrew, Brew Cask"
echo ""

read -p "Do you wish to continue? (y/n) " -n 1;
	echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then

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

	# Update Homebrew:
	brew update

	# Install Applications:
	brew cask install sublime-text3
	brew cask install intellij-idea
	brew cask install iterm2
	brew cask install dbvisualizer

	# Install perlbrew:
	\curl -L http://install.perlbrew.pl | bash

	# Install Development Platforms:
	brew install ant
	brew install groovy
	brew install python
	brew install perl
	brew install scala # Set SCALA_HOME to /usr/local/opt/scala/idea

	# Install Server and Database Software:
	# Make sure to set TOMCAT_HOME in the ~/.vars file
	brew install tomcat
	brew install postgres

	# Remove outdated versions from the cellar.
	brew cleanup

fi;