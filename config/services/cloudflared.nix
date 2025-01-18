{ config, pkgs, ... }:

{
  services.cloudflared = {
    enable = true;

    tunnels = {
      "241dce64-be43-40ed-8b0a-50f7e89096a1" = {
        credentialsFile = "${config.sops.secrets.cloudflared-creds.path}";
        ingress = {
          "*.morphotech.xyz" = {
            service = "http://localhost:8000";
            path = "/*.(jpg|png|css|js)";
          };
        };
        default = "http_status:404";
      };
    };
    
    
  }
}
