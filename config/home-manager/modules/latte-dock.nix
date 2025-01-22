{ config, lib, pkgs, ... }:

{
  # Install Latte Dock
  home.packages = with pkgs; [
    latte-dock
  ];

  # Autostart Latte Dock
  xsession.initExtra = ''
    if ! pgrep -x "latte-dock" > /dev/null; then
      latte-dock &
    fi
  '';

  # Configure Latte Dock settings
  xdg.configFile."latte/lattedockrc".text = ''
    [General]
    version=0.10

    [Containments]
    containment0=1

    [Containments][1]
    activityId=
    formFactor=0
    immutability=1
    lastScreen=0
    location=3
    plugin=org.kde.latte.containment
    screenGeometry=1920x1080+0+0
    version=0.10

    [Containments][1][Applets]
    applets=2

    [Containments][1][Applets][2]
    plugin=org.kde.latte.plasma

    [Containments][1][Configuration]
    PreloadWeight=100

    [Containments][1][General]
    debugMode=false
    showInMenu=true
  '';

  # Optional: Add a Latte Dock layout file
  xdg.dataFile."latte/layouts/default.layout.latte".text = ''
    [Layout]
    version=0.10

    [Containments]
    containment0=1

    [Containments][1]
    activityId=
    formFactor=0
    immutability=1
    lastScreen=0
    location=3
    plugin=org.kde.latte.containment
    screenGeometry=1920x1080+0+0
    version=0.10

    [Containments][1][Applets]
    applets=2

    [Containments][1][Applets][2]
    plugin=org.kde.latte.plasma

    [Containments][1][Configuration]
    PreloadWeight=100

    [Containments][1][General]
    debugMode=false
    showInMenu=true
  '';
}