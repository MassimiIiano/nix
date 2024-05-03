{
  config,
  lib,
  ...
}: let
  mod = "SUPER";
  modshift = "${mod}SHIFT";
in {
  wayland.windowManager.hyprland.settings = {
    bind =
      [

      ];

  };
}
