{ ... }: {
  programs.nixvim = {
    enable = true;

    # Appearance
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
      };
    };
    plugins.web-devicons.enable = true;
    plugins.lualine = {
      enable = true;
      settings.sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" "diff" "diagnostics" ];
        lualine_c = [ "filename" ];
        lualine_x = [ "encoding" "fileformat" "filetype" ];
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };
    };

    # Core Features
    plugins.nvim-tree.enable = true;
    plugins.treesitter = {
      enable = true;
      settings.ensure_installed =
        [ "go" "javascript" "typescript" "python" "rust" "nix" "lua" ];
    };

    # LSP Configuration
    plugins.lsp = {
      enable = true;
      servers = {
        lua_ls = {
          enable = true;
          settings.telemetry.enable = false;
        };
        ruff.enable = true;
        ts_ls.enable = true;
        nixd.enable = true;
        gopls.enable = true;
      };
    };

    # Completion
    plugins.cmp = {
      autoEnableSources = true;
      autoLoad = true;
      settings.sources = [
        { name = "buffer"; }
        { name = "luasnip"; }
        { name = "ts_ls"; }
        { name = "gopls"; }
        { name = "nixd"; }
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "ruff"; }
      ];
    };

    # Keybindings and Mappings
    globals.mapleader = " ";
    keymaps = [
      {
        key = "<leader>e";
        action = ":NvimTreeToggle<CR>";
        options.desc = "Toggle NvimTree";
      }
      {
        key = "<leader>w";
        action = ":w<CR>";
        options.desc = "Save file";
      }
      {
        key = "<leader>q";
        action = ":q<CR>";
        options.desc = "Quit";
      }
      {
        key = "<leader>h";
        action = ":nohlsearch<CR>";
        options.desc = "Clear search highlights";
      }
    ];

    # Additional Plugins
    plugins.telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fh" = "help_tags";
      };
    };

    opts = {
      # Enable relative line numbers
      number = true;
      relativenumber = true;

      # Set tabs to 2 spaces
      tabstop = 2;
      softtabstop = 2;
      showtabline = 0;
      expandtab = true;

      # Enable auto indenting and set it to spaces
      smartindent = true;
      shiftwidth = 2;

      # Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
      breakindent = true;

      # Enable incremental searching
      hlsearch = true;
      incsearch = true;
    };
  };
}
