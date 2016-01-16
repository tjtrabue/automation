#!/usr/bin/env bash

brew tap caskroom/cask

# Update Homebrew:
brew update

# Install Applications:
brew cask install sublime-text3
brew cask install intellij-idea
brew cask install iterm2
brew cask install dbvisualizer

# Install perlbrew:
curl -L http://install.perlbrew.pl | bash

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