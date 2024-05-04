{
  pkgs,
  lib,
  inputs,
  theme,
  ...
}:{

  home.packages = with pkgs; [ gnome.file-roller hyprlock ];
  # wayland.windowManager.hyprland.enable = true;
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf; 
  home.file.".config/hypr/start.sh".source = ./start.sh;
}
