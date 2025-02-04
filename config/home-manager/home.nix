{ config, pkgs, inputs, nixvim, ags, ... }:

{
  imports = [
    ./modules
    nixvim.homeManagerModules.nixvim
    ags.homeManagerModules.default
  ];

  home = {
    username = "marvin";
    homeDirectory = "/home/marvin";
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
