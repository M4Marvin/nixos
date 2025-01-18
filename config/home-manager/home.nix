{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules
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
      credential.helper = "${config.programs.gh.package}/bin/gh auth git-credential";
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
  
  home.stateVersion = "24.11";
}