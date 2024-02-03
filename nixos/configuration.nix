{ pkgs, username, ... }: {

  imports = [
    /etc/nixos/hardware-configuration.nix
    ./audio.nix
    # ./gnome.nix
    ./hyprland.nix
    ./laptop.nix
    ./locale.nix
  ];

  # nix
  documentation.nixos.enable = false; # .desktop
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  # virtualisation
  # programs.virt-manager.enable = true;
  # virtualisation = {
  #   podman.enable = true;
  #   libvirtd.enable = true;
  # };

  # dconf
  programs.dconf.enable = true;

  # packages
  environment.systemPackages = with pkgs; [ curl fish git home-manager wget ];

  # services
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
    };
    printing.enable = true;
    # flatpak.enable = true;
  };

  # logind
  services.logind.extraConfig = ''
    HandlePowerKey=ignore
    HandleLidSwitch=suspend
    HandleLidSwitchExternalPower=ignore
  '';

  # kde connect
  networking.firewall = rec {
    allowedTCPPortRanges = [{
      from = 1714;
      to = 1764;
    }];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  # user
  users.users.${username} = {
    isNormalUser = true;
    initialPassword = username;
    extraGroups =
      [ "nixosvmtest" "networkmanager" "wheel" "audio" "video" "libvirtd" ];
  };

  # network
  networking = {
    hostName = "CirnOS";
    networkmanager.enable = true;
  };

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings.General.Experimental = true; # for gnome-bluetooth percentage
  };

  # bootloader
  boot = {
    tmp.cleanOnBoot = true;
    supportedFilesystems = [ "btrfs" "ext4" "fat32" "ntfs" ];
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
      efi.canTouchEfiVariables = true;
    };
    # Normally I wouldn't use plymouth but this looks cool af
    # plymouth = rec {
    #   enable = true;
    #   # black_hud circle_hud cross_hud square_hud
    #   # circuit connect cuts_alt seal_2 seal_3
    #   theme = "circle_hud";
    #   themePackages = with pkgs;
    #     [
    #       (adi1090x-plymouth-themes.override { selected_themes = [ theme ]; })
    #     ];
    # };
  };

  system.stateVersion = "23.05";
}
