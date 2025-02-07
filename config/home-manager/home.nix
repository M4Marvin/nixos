{ config, pkgs, inputs, nixvim, ags, ... }:

{
  imports = [
    ./modules
    nixvim.homeManagerModules.nixvim
    ags.homeManagerModules.default
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "marvin";
    homeDirectory = "/home/marvin";
  };

  programs.starship = {
    enable = true;
    enableTransience = true;
    settings = {
      add_newline = false;
      scan_timeout = 10;
      character = {
        success_symbol = "➜";
        error_symbol = "➜";
      };
    };
  };

  programs.home-manager.enable = true;

  # systemd.useFr.startServices = "sd-switch";

  programs.git = {
    enable = true;
    userName = "Marvin V Prakash";
    userEmail = "marvinprakash@gmail.com";
    extraConfig = {
      credential.helper =
        "${config.programs.gh.package}/bin/gh auth git-credential";
    };
  };

  programs.gh = {
    enable = true;
    settings = {
      # GitHub CLI settings
      git_protocol = "https";
      # The auth token will be managed automatically by gh cli
    };
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-ndi
    ];
  };

  home.stateVersion = "24.11";
}
