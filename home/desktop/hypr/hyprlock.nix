_ : 
{
  programs.hyprlock = {
    enable = true;  
    sources = ./hyprlock.conf;  
  };
  # programs.hyprlock = {
  # home.file.".config/hypr/hyprlock.conf".source = ./hyprlock.conf;

}