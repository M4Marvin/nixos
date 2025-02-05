# nginx.nix
{ config, pkgs, ... }:

{
  # Nginx Configuration
  services.nginx = {
    enable = true;

    # Add RTMP module
    package = pkgs.nginxMainline.override {
      modules = with pkgs.nginxModules; [ rtmp ];
    };

    # RTMP Configuration
    appendConfig = ''
      rtmp {
        server {
          listen 1935;
          chunk_size 4096;

          application live {
            live on;
            record off;
          }
        }
      }
    '';

    # Basic recommended settings
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts = {
      # Main site
      "morphotech.xyz" = {
        locations."/" = {
          proxyPass = "http://localhost:3100"; # Next.js
          proxyWebsockets = true;
        };
      };

      # Charts subdomain
      "charts.morphotech.xyz" = {
        locations."/" = {
          proxyPass = "http://localhost:3001"; # Your charts service
        };
      };

      # CV subdomain
      "cv.morphotech.xyz" = {
        locations."/" = {
          proxyPass = "http://localhost:3002"; # Your CV service
        };
      };

      # Webhooks for CI/CD
      "hooks.morphotech.xyz" = {
        locations."/" = { proxyPass = "http://localhost:8001"; };
      };

    };
  };
}
