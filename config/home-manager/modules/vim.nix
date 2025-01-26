{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true; # Alias 'vi' to 'nvim'
    vimAlias = true; # Alias 'vim' to 'nvim'

    # Basic editor settings
    extraConfig = ''
      set number         " Show line numbers
      set relativenumber " Show relative line numbers
      set expandtab     " Use spaces instead of tabs
      set tabstop=2     " Tab width
      set shiftwidth=2  " Indentation width
      set autoindent    " Auto-indent new lines
      set smartindent   " Smart autoindenting
      set mouse=a       " Enable mouse support
      set clipboard+=unnamedplus  " Use system clipboard

      " Basic key mappings
      let mapleader = " "  " Set space as leader key

      " Basic quality of life mappings
      nnoremap <leader>w :w<CR>  " Quick save
      nnoremap <leader>q :q<CR>  " Quick quit
    '';

    # Basic plugins
    plugins = with pkgs.vimPlugins; [
      vim-nix # Nix syntax highlighting
      vim-lastplace # Remember last cursor position
      {
        plugin = nvim-tree-lua; # File explorer
        type = "lua";
        config = ''
          require('nvim-tree').setup{}
          vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
        '';
      }
    ];
  };
}
