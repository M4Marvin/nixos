{ config, pkgs, ... }:

{
  networking.hostName = "marvin";
  networking.networkmanager.enable = true;
  services.openssh = {
    enable = true; # Enable the OpenSSH service.
    openFirewall = true; # Open the firewall for SSH connections.

    banner = "/etc/ssh/banner.txt";
  };

  networking.firewall.allowedTCPPorts = [ 80 22 3210 8080 5353 5960 5961 5962 1935];
  networking.firewall.allowedUDPPorts = [ 5353 5960 5961 5962 ];

  # networking.wireless.enable = true;
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;

  environment.etc."ssh/banner.txt".text = ''
    **************************************************
    Welcome to the VPMC Server
    Unauthorized access is strictly prohibited.

    Proceed only if you have explicit permission.
    **************************************************
  '';

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;

  boot.kernelModules = [ "btusb" ];
}
