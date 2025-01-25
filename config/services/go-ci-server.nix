{ config, pkgs, ... }:

{
  systemd.services.main-site = {
    description = "Go Server for CI/CD";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      WorkingDirectory = "/home/marvin/Codes/go_server";
      ExecStart = "${pkgs.go}/bin/go run main.go";
      Restart = "always";
      Environment = "HOST=0.0.0.0 PORT=8001";
    };
    # user = "marvin"; 
  };
}