{ config, pkgs, ... }:

{
  users.users.marvin = {
    isNormalUser = true;
    description = "Marvin Prakash";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "marvin";
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}