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
