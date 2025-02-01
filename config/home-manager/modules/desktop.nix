{  pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    # Additional packages for Hyprland
    environment.systemPackages = with pkgs; [
      rofi # Application launcher
      mako # Notification daemon
      swaybg # Wallpaper utility
      swaylock # Screen locker
      wl-clipboard # Clipboard utility
      grim # Screenshot tool
      slurp # Region selection tool
      networkmanagerapplet
      acpi
      wob
    ];

    settings = {
      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, Return, exec, ghostty"
        "$mainMod, Q, killactive"
        "$mainMod, M, exit"
        "$mainMod, V, togglefloating"
        "$mainMod, S, exec, rofi -show drun -show-icons"
        "SHIFTSUPER,SEMICOLON,exit,"
        "SUPER,A,togglesplit,"

        ",XF86AudioPlay,exec,${pkgs.playerctl} play-pause"
        ",XF86AudioPrev,exec,${pkgs.playerctl} previous"
        ",XF86AudioNext,exec,${pkgs.playerctl} next"

        "SUPER,H,movefocus,l"
        "SUPER,J,movefocus,d"
        "SUPER,K,movefocus,u"
        "SUPER,L,movefocus,r"

        "SUPERCTRL,L,swapwindow,r"
        "SUPERCTRL,H,swapwindow,l"
        "SUPERCTRL,K,swapwindow,u"
        "SUPERCTRL,J,swapwindow,d"

        "SUPER,M,workspace,previous"
        "SUPER,Q,workspace,1"
        "SUPER,W,workspace,2"
        "SUPER,E,workspace,3"
        "SUPER,R,workspace,4"
        "SUPER,T,workspace,5"
        "SUPER,Y,workspace,6"
        "SUPER,U,workspace,7"
        "SUPER,I,workspace,8"
        "SUPER,O,workspace,9"
        "SUPER,P,workspace,10"

        "SUPERSHIFT,Q,movetoworkspace,1"
        "SUPERSHIFT,W,movetoworkspace,2"
        "SUPERSHIFT,E,movetoworkspace,3"
        "SUPERSHIFT,R,movetoworkspace,4"
        "SUPERSHIFT,T,movetoworkspace,5"
        "SUPERSHIFT,Y,movetoworkspace,6"
        "SUPERSHIFT,U,movetoworkspace,7"
        "SUPERSHIFT,I,movetoworkspace,8"
        "SUPERSHIFT,O,movetoworkspace,9"
        "SUPERSHIFT,P,movetoworkspace,10"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindowpixel"
        "$mainMod ALT, mouse:272, resizewindowpixel"
      ];
      binde = [
            "SUPERSHIFT,H,resizeactive,-150 0"
            "SUPERSHIFT,J,resizeactive,0 150"
            "SUPERSHIFT,K,resizeactive,0 -150"
            "SUPERSHIFT,L,resizeactive,150 0"

            ",XF86AudioRaiseVolume,exec, pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | awk '{print substr($5, 1, length($5)-1)}' > $WOBSOCK"
            ",XF86AudioLowerVolume,exec, pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | awk '{print substr($5, 1, length($5)-1)}' > $WOBSOCK"
            '',XF86AudioMute,exec,${pkgs.pamixer} --toggle-mute && ( [ "$(${pkgs.pamixer} --get-mute)" = "true" ] && echo 0 > $WOBSOCK ) || ${pkgs.pamixer} --get-volume > $WOBSOCK''

            ",XF86MonBrightnessUp,exec,${pkgs.lib.getExe pkgs.brightnessctl} set +5%"
            ",XF86MonBrightnessDown,exec,${pkgs.lib.getExe pkgs.brightnessctl} set 5%-"
          ];
      monitor = [ ",preferred,auto,1" ];
      input = {
        kb_layout = "us";
        follow_mouse = 1;
      };
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
      };
      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 4;
          passes = 4;
          ignore_opacity = 1;
          xray = 1;
          new_optimizations = 1;
          noise = 0.03;
          contrast = 1.0;
        };
      };
      animations = {
        enabled = true;
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      gestures = {
        workspace_swipe = true;
      };
      exec-once = [
        "waybar"
      ];
    };
  };

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    WOBSOCK = "/tmp/wob.sock";
  };
  
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config = {
      common.default = "*";
    };
  };
}
