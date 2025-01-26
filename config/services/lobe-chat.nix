{ config, pkgs, ... }:

{
  systemd.services.lobe-chat = {
    description = "Lobe Chat";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      WorkingDirectory = "/home/marvin/Codes/lobe-chat";
      ExecStart = "/run/current-system/sw/bin/bun start";
      Restart = "always";
      Environment = "HOST=0.0.0.0 PORT=3210";
    };
    # user = "marvin"; 
  };
}
