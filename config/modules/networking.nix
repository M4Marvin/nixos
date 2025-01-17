{ config, ... }:

{
  networking.hostName = "marvin";
  networking.networkmanager.enable = true;
  services.openssh = {
      enable = true;                            # Enable the OpenSSH service.
      openFirewall = true;                      # Open the firewall for SSH connections.

      banner = "/etc/ssh/banner.txt";     
  }

  networking.firewall.allowedTCPPorts = [ 22 ];

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
}