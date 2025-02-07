{ pkgs, ags, ... }:

{

  # Enable ags
  programs.ags = {
    enable = true;
    configDir = ./ags; # Adjust path to your ags directory
  };

  home.packages =
    [ ags.packages.${pkgs.system}.io ags.packages.${pkgs.system}.notifd ];
}
