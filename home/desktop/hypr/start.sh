#!/usr/bin/env bash

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
