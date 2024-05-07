_ : 
{
  programs.hyprlock = {
    enable = true;
    extraConfig = 
    ''
general {
  disable_loading_bar = false
  grace = 0
  hide_cursor = true
  no_fade_in = false
  no_fade_out = false
  ignore_empty_input = false
}

background {
  monitor = 
  path = echo '~/Pictures/backgrounds/coko-cake.png'
  color = rgba(25, 20, 20, 1.0)
  blur_size = 8
  blur_passes = 0
  noise = 0.011700
  contrast = 0.891700
  brightness = 0.817200
  vibrancy = 0.168600
  vibrancy_darkness = 0.050000
}


input-field {
  monitor = 
  size = 200, 50
  outline_thickness = 3
  dots_size = 0.330000
  dots_spacing = 0.150000
  dots_center = true
  dots_rounding = -1
  outer_color = rgb(151515)
  inner_color = rgb(200, 200, 200)
  font_color = rgb(10, 10, 10)
  fade_on_empty = true
  fade_timeout = 2000
  placeholder_text = <i>Input Password...</i>
  hide_input = false
  rounding = -1
  shadow_passes = 0
  shadow_size = 3
  shadow_color = rgba(0, 0, 0, 1.0)
  shadow_boost = 1.200000
  check_color = rgb(204, 136, 34)
  fail_color = rgb(204, 34, 34)
  fail_text = <i>$FAIL</i>
  fail_transition = 300
  capslock_color = -1
  numlock_color = -1
  bothlock_color = -1
  invert_numlock = false
  swap_font_color = false

  position = 0, -20
  halign = center
  valign = center
}
    '';
  };
}