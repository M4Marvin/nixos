{ pkgs, ... }:

{
  services = {
    flatpak.enable = true;
    dbus.enable = true;
    picom.enable = true;
  };
  
  environment.systemPackages = with pkgs; [
    home-manager
    # General System Packages
    vim
    bat
    zoxide
    fzf
    bottom
    sl
    yazi
    zellij
    neovim
    lsd
    gh
    gitui
    which
    fish
    nushell
    tree
    wget
    curl
    git
    libsecret
    xdg-utils
    rustdesk
    neofetch
    unzip

    shellcheck
    nerd-fonts.fira-code

    # Terminal
    ghostty

    # Languages
    go
    conda
    uv

    # Web Dev
    vscode
    bun
    deno
    nodejs
    httpie
    docker
    nginx

    # Steam
    steam
    steam-run

    ripgrep
    zoxide
    cloudflared
    (lutris.override {
      extraPkgs = pkgs: [
        # List package dependencies here
        wineWowPackages.stable
        winetricks
      ];
    })
  ];

  # Computational Biology Packages
  # environment.systemPackages = with pkgs; [
  #   biopython
  #   blast
  #   clustalw
  #   samtools
  #   bedtools
  #   bioconda
  # ];

  # Future Categories (Add as needed)
  # environment.systemPackages = with pkgs; [
  #   # Add your future package choices here
  # ];

  # Additional System Configurations (for specific setups)
  # For example, setting environment variables, paths, or special configurations.
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    nerd-fonts.fira-code
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

}