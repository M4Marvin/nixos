{ config, pkgs, ... }:

{
  # Enable Xserver (required for display managers)
  services.xserver.enable = true;

  # Use SDDM as the display manager (optional, you can use another or none)
  # services.displayManager.sddm.enable = true;

  # Set Hyprland as the default session
  services.displayManager.defaultSession = "hyprland";

  # Keyboard layout
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true; # Enable XWayland for X11 compatibility

  };

  # Printing support
  services.printing.enable = true;

  # Enable Firefox
  programs.firefox.enable = true;

  # Allow unfree packages (e.g., for Nvidia drivers)
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    pulseaudio
    brightnessctl
    acpi
    wob
  ];
}

