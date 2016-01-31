#!/bin/env bash

alias co="git checkout"
alias gl="git log -3"
alias gs="git status"
alias gtrack="git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD)"