# configuration.nix
{ config, pkgs, ... }:

{
  # Nginx Configuration
  services.nginx = {
    enable = true;
    
    # Basic recommended settings
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts = {
      # Main site
      "morphotech.xyz" = {
        locations."/" = {
          proxyPass = "http://localhost:3000";  # Next.js
          proxyWebsockets = true;
        };
      };

      # Charts subdomain
      "charts.morphotech.xyz" = {
        locations."/" = {
          proxyPass = "http://localhost:3001";  # Your charts service
        };
      };

      # CV subdomain
      "cv.morphotech.xyz" = {
        locations."/" = {
          proxyPass = "http://localhost:3002";  # Your CV service
        };
      };
    };
  };

  # Open required ports
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 ];  # For Nginx
  };
}