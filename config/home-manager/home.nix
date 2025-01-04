{ config, pkgs, inputs, ... }:

{
  imports = [
    ./ghostty.nix
  ];

  home = {
    username = "marvin";
    homeDirectory = "/home/marvin";
  };

  programs.home-manager.enable = true;


  # systemd.user.startServices = "sd-switch";


  programs.git = {
    enable = true;
    userName = "Marvin V Prakash";
    userEmail = "marvinprakash@gmail.com";
  };

  programs.ghostty = {
    enable = true;
    settings = {
      # Window padding
      window-padding-x = 20;
      window-padding-y = 20;

      # Opacity and blur
      background-opacity = 0.8;
      background-blur-radius = 10;

      # Font settings
      font-family = "FiraCode Nerd Font";
      font-style = "Regular";
      font-size = 18;

      theme = "catppuccin-mocha";

      window-decoration = true;

      macos-titlebar-style = "transparent";
      gtk-titlebar = true;
    };
  };
  
  home.stateVersion = "24.11";
}