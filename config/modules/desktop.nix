{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.printing.enable = true;
  
  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
}