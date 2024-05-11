#!/usr/bin/env bash

# initialize wallpaper daemon
swww-daemon &

# notification daemon
dunst &

# set wallpaper
images=(~/Pictures/backgrounds/*)

# loop over the images
while true; do
  for img in "${images[@]}"; do
    # set wallpaper
    swww img "$img" &
    # wait for x seconds
    sleep 10
  done
done
