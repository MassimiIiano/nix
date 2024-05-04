{
  pkgs,
  lib,
  inputs,
  theme,
  ...
}:{

  home.packages = with pkgs; [ gnome.file-roller ];
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf; 
  home.file.".config/hypr/start.sh".source = ./start.sh;
  
}
