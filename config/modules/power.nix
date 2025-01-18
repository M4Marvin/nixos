{ config, pkgs, ... }:
{
  # Disable lid switch handling
  services.logind = {
    lidSwitch = "ignore";
    lidSwitchExternalPower = "ignore";
    extraConfig = ''
      HandleLidSwitch=ignore
      HandleLidSwitchExternalPower=ignore
      IdleAction=ignore
    '';
  };

  # Prevent sleep when lid is closed
  powerManagement = {
    enable = true;
    powertop.enable = false;  # Disable powertop auto-tuning
  };

  # Optional: Prevent system sleep on inactivity
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
  '';
}

