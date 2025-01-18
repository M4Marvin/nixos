# configuration.nix
{ config, pkgs, ... }:

{
  services.cloudflared = {
    enable = true;
    package = pkgs.cloudflared;
    tunnels = {
      "241dce64-be43-40ed-8b0a-50f7e89096a1" = {
        credentialsFile = "/home/marvin/.cloudflared/cert.pem";
        # Just the main website for now
        ingress = {
          "morphotech.xyz" = {
            service = "http://localhost:3000";
          };
          default = "http_status:404";
        };
      };
    };
  };
}