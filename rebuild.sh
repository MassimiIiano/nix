#!/usr/bin/env bash

set -e

# Ask for sudo password upfront
sudo -v

# Parse arguments to extract --update
args=()
update=false
for arg in "$@"; do
    if [ "$arg" == "--update" ]; then
        update=true
    else
        args+=("$arg")
    fi
done

# Restore positional parameters without --update
set -- "${args[@]}"

# Update flake if requested
if [ "$update" = true ]; then
    echo "Updating flake..."
    nix flake update
fi

gen=$(nix-env --list-generations | awk '/current/ {print}')

# Check if the user has provided a commit message
if [ -z "$1" ]; then
    echo "No commit message provided. Using default message."
    set -- "No message provided" "$2"
fi

# Check if the user has provided a issue number
if [ -n "$2" ]; then
    set -- "$1" " #$2"
else
    echo "No issue number provided. not linking commit to an issue."
    # If no second argument, just use the first argument as is
    set -- "$1" ""
fi

# Rebuild NixOS before committing so failed updates stay uncommitted.
sudo nixos-rebuild switch --flake ./#marvin

# Add all files to the staging area
# Commit the changes with the current date and time as the message
git add -A
if git diff --cached --quiet; then
    echo "No changes to commit."
else
    git commit -m "switch marvin$2: $1, $gen"
fi
git pull

# Push the changes to the remote repository
git push
