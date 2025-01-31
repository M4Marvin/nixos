{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "sway/workspaces" "sway/mode" ];
        modules-center = [ "clock" ];
        modules-right = [ "network" "pulseaudio" "cpu" "memory" "battery" "tray" ];

        network = {
          format = "{ifname}";
          format-wifi = " {essid} ({signalStrength}%)";
          format-ethernet = " {ipaddr}/{cidr}";
          format-disconnected = "⚠ Disconnected";
          tooltip-format = "{ifname} via {gwaddr}";
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          tooltip-format-ethernet = "{ifname}  {ipaddr}/{cidr}";
          tooltip-format-disconnected = "Disconnected";
          max-length = 50;
        };

        clock = {
          format = "{:%Y-%m-%d %H:%M}";
          tooltip-format = "{:%A, %B %d, %Y}";
        };

        cpu = {
          format = " {usage}%";
          interval = 5;
        };

        memory = {
          format = " {used:0.1f}G/{total:0.1f}G";
          interval = 5;
        };

        battery = {
          format = "{capacity}% {icon}";
          format-icons = [ "" "" "" "" "" ];
          interval = 10;
        };

        tray = {
          icon-size = 20;
          spacing = 10;
        };
      };
    };
    style = ''
      * {
        border: none;
        font-family: "FiraCode Nerd Font";
        font-size: 14px;
      }

      window#waybar {
        background-color: rgba(40, 40, 40, 0.9);
        color: #ffffff;
      }

      #workspaces button {
        padding: 0 10px;
        background-color: transparent;
        color: #ffffff;
      }

      #workspaces button.focused {
        background-color: #64727d;
      }

      #clock {
        background-color: #64727d;
        padding: 0 10px;
      }

      #network {
        background-color: #64727d;
        padding: 0 10px;
      }

      #cpu {
        background-color: #64727d;
        padding: 0 10px;
      }

      #memory {
        background-color: #64727d;
        padding: 0 10px;
      }

      #battery {
        background-color: #64727d;
        padding: 0 10px;
      }

      #tray {
        background-color: #64727d;
        padding: 0 10px;
      }
    '';
  };
}
