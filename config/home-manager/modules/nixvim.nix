{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    enableMan = true; # Enable manpages for nixvim options
    defaultEditor = true;

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
    plugins.nvim-tree = { enable = true; };

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
      enable = true;
      autoEnableSources = true;
      autoLoad = true;
      settings = {
        sources = [
          { name = "buffer"; }
          { name = "luasnip"; }
          { name = "ts_ls"; }
          { name = "gopls"; }
          { name = "nixd"; }
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "ruff"; }
        ];
        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
          "<C-Space>" = "cmp.mapping.complete()";
        };
      };
    };

    plugins.alpha = {
      enable = true;
      layout = [
        {
          type = "padding";
          val = 2;
        }
        {
          opts = {
            hl = "Type";
            position = "center";
          };
          type = "text";
          val = [
            "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
            "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
            "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
            "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
            "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
            "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "group";
          val = [
            {
              on_press = { __raw = "function() vim.cmd[[ene]] end"; };
              opts = { shortcut = "n"; };
              type = "button";
              val = "  New file";
            }
            {
              on_press = { __raw = "function() vim.cmd[[qa]] end"; };
              opts = { shortcut = "q"; };
              type = "button";
              val = " Quit Neovim";
            }
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          opts = {
            hl = "Keyword";
            position = "center";
          };
          type = "text";
          val = "Inspiring quote here.";
        }
      ];
    };

    # Keybindings and Mappings
    globals.mapleader = " ";
    # Enhanced Keybindings and Mappings
    keymaps = let
      lspBuf = "vim.lsp.buf";
      diag = "vim.diagnostic";
    in [
      # Existing keymaps
      {
        key = "<leader>e";
        action = ":NvimTreeToggle<CR>";
        options.desc = "Toggle file tree";
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

      # Improved navigation
      {
        key = "<C-d>";
        action = "<C-d>zz";
        options.desc = "Center screen when paging down";
      }
      {
        key = "<C-u>";
        action = "<C-u>zz";
        options.desc = "Center screen when paging up";
      }
      {
        key = "n";
        action = "nzzzv";
        options.desc = "Center next search result";
      }
      {
        key = "N";
        action = "Nzzzv";
        options.desc = "Center previous search result";
      }

      # Window management
      {
        key = "<leader>sv";
        action = "<C-w>v";
        options.desc = "Vertical split";
      }
      {
        key = "<leader>sh";
        action = "<C-w>s";
        options.desc = "Horizontal split";
      }
      {
        key = "<C-h>";
        action = "<C-w>h";
        options.desc = "Move to left window";
      }
      {
        key = "<C-j>";
        action = "<C-w>j";
        options.desc = "Move to lower window";
      }
      {
        key = "<C-k>";
        action = "<C-w>k";
        options.desc = "Move to upper window";
      }
      {
        key = "<C-l>";
        action = "<C-w>l";
        options.desc = "Move to right window";
      }

      # Buffer management
      {
        key = "<leader>bd";
        action = ":bdelete<CR>";
        options.desc = "Close buffer";
      }
      {
        key = "<leader>bn";
        action = ":bnext<CR>";
        options.desc = "Next buffer";
      }
      {
        key = "<leader>bp";
        action = ":bprevious<CR>";
        options.desc = "Previous buffer";
      }

      # LSP keymaps
      {
        key = "gd";
        action = "<cmd>lua ${lspBuf}.definition()<CR>";
        options.desc = "Go to definition";
      }
      {
        key = "gr";
        action = "<cmd>lua ${lspBuf}.references()<CR>";
        options.desc = "Show references";
      }
      {
        key = "gD";
        action = "<cmd>lua ${lspBuf}.declaration()<CR>";
        options.desc = "Go to declaration";
      }
      {
        key = "gI";
        action = "<cmd>lua ${lspBuf}.implementation()<CR>";
        options.desc = "Go to implementation";
      }
      {
        key = "K";
        action = "<cmd>lua ${lspBuf}.hover()<CR>";
        options.desc = "Show documentation";
      }
      {
        key = "<leader>rn";
        action = "<cmd>lua ${lspBuf}.rename()<CR>";
        options.desc = "Rename symbol";
      }
      {
        key = "<leader>ca";
        action = "<cmd>lua ${lspBuf}.code_action()<CR>";
        options.desc = "Code action";
      }
      {
        key = "<leader>f";
        action = "<cmd>lua ${lspBuf}.format()<CR>";
        options.desc = "Format buffer";
      }

      # Diagnostics
      {
        key = "[d";
        action = "<cmd>lua ${diag}.goto_prev()<CR>";
        options.desc = "Previous diagnostic";
      }
      {
        key = "]d";
        action = "<cmd>lua ${diag}.goto_next()<CR>";
        options.desc = "Next diagnostic";
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

      # Clipboard integration
      clipboard = "unnamedplus";

      # Persistent undo
      undofile = true;

      # Better search
      ignorecase = true;
      smartcase = true;

      # Terminal colors
      termguicolors = true;

      # Hidden buffers
      hidden = true;

      # Cursor line
      cursorline = true;

      # Sign column for LSP
      signcolumn = "yes";

      # Scroll offset
      scrolloff = 8;
    };

    # Auto-commands
    extraConfigVim = ''
      " Automatically format on save
      augroup formatting
        autocmd!
        autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })
      augroup END

      " Set clipboard provider for Wayland/X11
      let g:clipboard = {
        \   'name': '${
          if pkgs.stdenv.isLinux then "wl-clipboard" else "pbcopy"
        }',
        \   'copy': {
        \      '+': '${pkgs.wl-clipboard}/bin/wl-copy --foreground --type text/plain',
        \      '*': '${pkgs.wl-clipboard}/bin/wl-copy --foreground --type text/plain',
        \    },
        \   'paste': {
        \      '+': '${pkgs.wl-clipboard}/bin/wl-paste --no-newline',
        \      '*': '${pkgs.wl-clipboard}/bin/wl-paste --no-newline',
        \    },
        \   'cache_enabled': 1,
        \ }
    '';
  };
}
