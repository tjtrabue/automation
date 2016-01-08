#!/bin/bash

#########################################
##		 		 General	           ##
#########################################

alias sbp="source $HOME/.bash_profile"


#########################################
##		 Directory Manipulation	       ##
#########################################

diralias () {
	if [[ -z $1 ]]; then
		echo "Creates a directory alias for the current directory"
		echo "with the name supplied as an argument."
		echo
		echo "Usage: diralias <name of directory alias>"
		return
	fi

	echo "export $1=`pwd`" >> ~.dirs
	source ~.dirs
}


#########################################
##		 		Sourcing	           ##
#########################################

# Source all files in the hidden source folder
src () {
	for f in ~/.dotfiles/source ; do
		source f
	done
}



