#!/bin/env bash

brew update

for f in ../source/; do
    cp $f ~/".automation/source/$f"
    source ~/".automation/source/$f"
done