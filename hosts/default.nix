{
  nixpkgs,
  self,
  # inputs,
  ...
}: let
  inherit (self) inputs;
  docker = ../sytem/core/docker.nix;
  # hm-module = inputs.h
in {
  # all my hosts are named after saturn moons btw

  # desktop
  marvin = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        {networking.hostName = "marvin";}
        ./marvin
        docker
      ];
    specialArgs = {inherit inputs;};
  };

  # thinkpad
  # calypso = nixpkgs.lib.nixosSystem {
  #   system = "x86_64-linux";
  #   modules =
  #     [
  #       {networking.hostName = "calypso";}
  #       ./calypso
  #       wayland
  #       hmModule
  #       bootloader
  #       impermanence
  #       hw.lenovo-thinkpad-x1-7th-gen
  #       {inherit home-manager;}
  #     ];
  #   specialArgs = {inherit inputs;};
  # };
}
