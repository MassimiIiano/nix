{
  pkgs,
  lib,
  inputs,
  theme,
  ...
}:{

  # wayland.windowManager.hyprland.enable = true;
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf; 
  
}
