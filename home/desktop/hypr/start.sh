#!/usr/bin/env bash

# initialize wallpaper daemon
swww-daemon &

# set wallpaper
swww img ~/Pictures/backgrounds/confy-distopia.gif &

# notification daemon
dunst 