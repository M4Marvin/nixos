{  inputs, pkgs, ags, ... }:

{
  # Enable ags
  programs.ags = {
    enable = true;
    gtk4 = true;
    # entry = "./ags"
  };
} 
