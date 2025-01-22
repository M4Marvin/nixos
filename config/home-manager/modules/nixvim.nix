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
      settings.ensure_installed = [ "python" "go" "javascript" ];
    };

    plugins.nvim-tree = {
      enable = true;
    };

    # Explicitly enable web-devicons
    plugins.web-devicons = {
      enable = true;
    };
  };
}