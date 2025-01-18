{ config, pkgs, ... }:

{
  services.cloudflared = {
    enable = true;
    package = pkgs.cloudflared;
    
    tunnels = {
      "241dce64-be43-40ed-8b0a-50f7e89096a1" = {
        credentialsFile = "/home/marvin/.cloudflared/cert.pem";
        default = "http_status:404";
        ingress = {
          # Main website configuration
          "morphotech.xyz" = {
            service = "http://localhost:3000";
            path = "/*.(jpg|png|css|js)";
          };
          # The default case needs to be a separate key in ingress
        };
      };
    };
  };
}
