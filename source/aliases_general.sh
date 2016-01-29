#!/bin/env bash

alias sbp=source\ ~/.bash_profile

alias echo="echo -e"

alias lsa="ls -a"

alias rmr="rm -r"
alias rmrf="rm -rf"

alias svars="source ~/.vars"
alias sdirs="source ~/.dirs"

alias path="echo $PATH"

# Returns the name of the directory of the script that this function is called from:
alias filedir=`echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"`

alias chx="chmod +x"