{ config, pkgs, ... }:

{
  services.cloudflared = {
    enable = true;
    package = pkgs.cloudflared;
    user= "marvin";  
    tunnels = {
      "6bf978c7-d774-4c8b-97d2-d2b21dc932fc" = {
        credentialsFile = "/home/marvin/.cloudflared/6bf978c7-d774-4c8b-97d2-d2b21dc932fc.json";
        default = "http_status:404";
        ingress = {
          # Catch all subdomains and send to Nginx
          "*.morphotech.xyz" = {
            service = "http://localhost:80";  
            path = "/*";
          };
          # Main domain
          "morphotech.xyz" = {
            service = "http://localhost:80";
            path = "/*";
          };
          "default" = "http_status:404";
        };
      };
    };
  };
}
