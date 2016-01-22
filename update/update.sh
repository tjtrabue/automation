#!/bin/env bash

brew update
brew cleanup

for f in ./source/*; do
    cp $f ~/".automation/source/$(basename $f)"
    source ~/".automation/source/$(basename $f)"
done