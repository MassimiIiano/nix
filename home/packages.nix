{pkgs, ...}: {
  nixpkgs.config.allowUnfree = false;
  home.packages = with pkgs; [
    # essentials
    firefox               # web browser
    libreoffice-fresh     # libreoffice
    gimp                  # image editor

    # social
    discord               # chat client

    # dev tools
    gh                    # github cli
    vscode                # code editor 
    docker-compose        # docker

    # cybersicurity
    wireshark             # network analysis
    burpsuite             # web app pentesting
    ngrok                 # tunneling
    ghidra                # reverse engineering

    # for hyprland
    waybar

    # gaming
    protonup              # protonvpn cli
    bastet                # tetris
  ];
}