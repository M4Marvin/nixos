{ config, pkgs, ... }:

{
  systemd.services.main-site = {
    description = "Main MorphoTech Site";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      WorkingDirectory = "/home/marvin/Codes/morphotech";
      ExecStart = "/run/current-system/sw/bin/bunx serve@latest out";
      Restart = "always";
      Environment = "HOST=0.0.0.0 PORT=3100";
    };
    # user = "marvin"; 
  };
}
