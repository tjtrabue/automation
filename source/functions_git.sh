#!/bin/env bash

# This file contains handy functions for automating
# all sorts of git operations, broken up into categories.
#
# The categories are:
# Add/Commit/Push
# Branching

#########################################
##           Add/Commit/Push           ##
#########################################

# Adds files, commits them, and pushes them to
# the remote repository:
gacp () {
    gacp_usage () {
        echo "Add, commit, and push files to remote repository" 1>&2
        echo "all in one command." 1>&2
        echo "" 1>&2
        echo "Usage:" 1>&2
        echo "gacp [-m (message) -b (branch name) <file names>]" 1>&2
        echo "" 1>&2
        echo "Options:" 1>&2
        echo "  -m <message> : the commit message (will be prompted for one if this arguemnet is omitted)" 1>&2
        echo "  -b <remote branch> : the name of the remote branch to push changes to (\"master\" by default)" 1>&2
    }

    if [[ "$1" == "--help" || "$1" == "-h" ]]; then
        gacp_usage
        return 1
    fi

    if [[ `isrepo` == "false" ]]; then
        echo "Not a git repository" 1>&2
        echo "Aborting" 1>&2
        return 1
    fi

    # Local variables
    local commit_message=""
    local remote_branch="master"

    local OPTIND o
        while getopts ":m:b:" o; do
            case "${o}" in
                m)
                    commit_message="${OPTARG}"
                    ;;
                b)
                    remote_branch="${OPTARG}"
                    ;;
                *)
                    gacp_usage
                    return
                    ;;
            esac
        done
        shift $((OPTIND-1))

    while [[ "$commit_message" == "" ]]; do
        echo "Type a commit message, then press ENTER:" 1>&2
        read commit_message
    done

    for file in "$@"; do
        git add "$file"
    done

    git commit -m "$commit_message"
    git push origin "$remote_branch"
}


#########################################
##              Branching              ##
#########################################

# Alias function for making a new branch:
nb () {
    git checkout -b "$@"
}


#########################################
##                 Info                ##
#########################################

# Determines whether or not the current directory is in a git
# repository:
isrepo () {
    if git rev-parse --git-dir >> /dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

#########################################
##                Editor               ##
#########################################

# Changes the designated git editor.
# Options are Sublime, Atom, and Vim:
switchgeditor () {
    if [[ "$#" -ne 1 ]]; then
        echoe "No editor name supplied."
        echo "Valid options are sublime, atom, and vim." 1>&2
        return 1
    fi

    case "${1}" in
        "sublime")
            git config --global core.editor "subl -w"
            ;;
        "atom")
            git config --global core.editor "atom --wait"
            ;;
        "vim")
            git config --global core.editor "vim"
            ;;
        *)
            echoe "Unknown operand $1."
            echo "Please enter sublime, atom, or vim as an" 1>&2
            echo "argument to this function." 1>&2
            return 1
            ;;
    esac
}








