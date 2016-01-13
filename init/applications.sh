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