{ config, pkgs, ... }: {
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
}
