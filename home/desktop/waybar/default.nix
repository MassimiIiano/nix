# This Nix expression defines the configuration for the Waybar status bar.
{ pkgs, lib, ... }:
{
  # Configure the Waybar program.
  programs.waybar = {
    enable = true;
    style = import ./style.nix;
  };
}
