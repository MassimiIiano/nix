#!/usr/bin/env bash

# Add all files to the staging area
git add .

# Commit the changes with the current date and time as the message
git commit -m "home-manager switch: $1"

# Push the changes to the remote repository
git push

# Rebuld NixOS
home-manager switch