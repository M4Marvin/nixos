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
  };
  
  home.stateVersion = "24.11";
}