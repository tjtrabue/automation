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
        echo gacp_usage
        return
    fi

    # Local variables
    local commit_message=""
    local remote_branch="master"

    local OPTIND o
        while getopts ":m:a:b:" o; do
            case "${o}" in
                m)
                    commit_message="${OPTARG}"
                    ;;
                b)
                    remote_branch="${OPTARG}"
                    ;;
                *)
                    func_usage
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