#!/bin/env bash

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
##             Information             ##
#########################################

# Lists all scope extensions for Sublime snippets:
sub_scopes () {
 cat ~/.automation/sublime-scopes
}

#########################################
##		 		Navigation	           ##
#########################################

# A wrapper for the cd function:
cd () {

}

#########################################
##		 		Sourcing	           ##
#########################################

# Source all files in the hidden automation folder:
src () {
	for f in ~/.automation/source ; do
		source $f
	done
}



