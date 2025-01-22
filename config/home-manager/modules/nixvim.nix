{ config, pkgs, ... }:
{
  programs.nixvim = {
    enable = true;

    # Colorschemes
    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };

    plugins.lualine.enable = true;

    # Enable treesitter for syntax highlighting
    plugins.treesitter = {
      enable = true;
      settings.ensure_installed = [ "python" "go" "javascript" ];  # Updated option
    };

    plugins.nvim-tree = {
      enable = true;
    };

    # Configure mini plugin with icons
    plugins.mini = {
      enable = true;
      modules = {
        # Enable the 'icons' module
        icons = {
          enable = true;  # Enable the icons module
        };
        # Enable mock dev icons (optional, if needed)
        mockDevIcons = {
          enable = true;  # Enable mock dev icons
        };
      };
    };

    # Explicitly disable web-devicons to avoid deprecation warning
    plugins.web-devicons = {
      enable = false;  # Disable web-devicons since we're using mini
    };
  };
}