_ : 
{
  programs.hyprlock = {
    enable = true;  
    settings = {
    background = [
      {
        path = "~/Pictures/backgrounds/two-cakes.png";
        blur_passes = 3;
        blur_size = 8;
      }
    ];
    };
  };
}