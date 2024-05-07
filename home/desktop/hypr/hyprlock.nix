_ : 
{
  programs.hyprlock = {
    enable = true;
    # extraConfig = 
    
  };
  # programs.hyprlock = {
  home.file.".config/hypr/hyprlock.conf".source = ./hyprlock.conf;

}