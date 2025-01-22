{ config, pkgs, ... }: {
  programs.nixvim = {
    enable = true;

     # Colorschemes
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour;
        background.dark = "mocha";
      };
    };
    
    plugins.lualine.enable = true;

    # Enable treesitter for syntax highlighting
    plugins.treesitter = {
      enable = true;
      ensureInstalled = [ "python" "go" "javascript" ];
    };
    
    plugins.nvim-tree = {
      enable = true;
    };
  };
}