#!/bin/env bash

#########################################
##              Sourcing               ##
#########################################

src () {
	source ~/.bash_profile
}


#########################################
##		 Directory Manipulation	       ##
#########################################

diralias () {
	diralias_usage () {
		echo "Creates a directory alias for the current directory"
		echo "with the name supplied as an argument."
		echo
		echo "Usage: diralias <name of directory alias>"
	}



	echo "export $1=`pwd`" >> ~.dirs
	source ~/.dirs
}


#########################################
##             Information             ##
#########################################

# Lists all scope extensions for Sublime snippets:
subscopes () {
	cat ~/.automation/snippet_scopes
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



