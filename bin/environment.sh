#!/usr/bin/env bash

# Place all necessary folders and files on the filesystem for development

# Local variables for referencing project folders:
local repo_automation=".."
local repo_copy="$repo_automation/copy"
local repo_link="$repo_automation/link"
local repo_source="$repo_automation/source"

# Create a .automation folder in the user's home directory
# to house all files:
mkdir ~/.automation


# Create a directory for Sublime Text projects:
mkdir ~/Sublime_Projects

# Install Package Control plugin on the new Sublime installation:
cp "$repo_copy/Package Control.sublime-package" ~/"Library/Application Support/Sublime Text 3/Installed Packages/Package Control.sublime-package"

# Copy Sublime preference files:
cp "$repo_copy/Package Control.sublime-settings" ~/"Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings"
cp "$repo_copy/Preferences.sublime-settings" ~/"Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"