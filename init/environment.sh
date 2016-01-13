#!/usr/bin/env bash

# Place all necessary folders and files on the filesystem for development

# Local variables for referencing project folders:
local repo_automation=".."
local repo_copy="$repo_automation/copy"
local repo_link="$repo_automation/link"
local repo_source="$repo_automation/source"

# Create the .automation file structure to hold all hidden environment files:
mkdir ~/.automation
mkdir ~/.automation/bin
mkdir ~/.automation/link

# Make hidden variables and directories files if they do not exist:
if [[ ! -f ~/.vars ]] ; then cp "$repo_copy/.vars" ~/.vars ; fi
if [[ ! -f ~/.dirs ]]; then cp "$repo_copy/.dirs" ~/.dirs ; fi

# Create a directory for Sublime Text projects:
mkdir ~/Sublime_Projects

# Install Package Control plugin on the new Sublime installation:
cp "$repo_copy/Package Control.sublime-package" ~/"Library/Application Support/Sublime Text 3/Installed Packages/Package Control.sublime-package"

# Copy Sublime preference files:
cp "$repo_copy/Package Control.sublime-settings" ~/"Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings"
cp "$repo_copy/Preferences.sublime-settings" ~/"Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"

# Copy scopes file for reference:
cp "$repo_copy/snippet_scopes" ~/.automation/

# Copy all hidden source files:
rsync -av --progress "$repo_source" ~/.automation