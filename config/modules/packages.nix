{ pkgs, ... }:

{
  services = {
    dbus.enable = true;
    flatpak.enable = true;
    picom.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # General System Packages
    bat
    bottom
    curl
    fish
    fzf
    gh
    git
    gitui
    home-manager
    libsecret
    lsd
    neofetch
    neovim
    nushell
    rustdesk
    sl
    tree
    unzip
    vim
    wget
    which
    yazi
    zellij
    zoxide

    # Terminal
    ghostty

    # Languages
    conda
    go
    uv

    # Web Dev
    bun
    deno
    docker
    httpie
    nginx
    nodejs
    vscode

    # Gaming
    lutris.override {
      extraPkgs = pkgs: [
        wineWowPackages.stable
        winetricks
      ];
    }
    protonplus
    steam
    steam-run

    # Utilities
    blueman
    cloudflared
    nerd-fonts.fira-code
    ripgrep
    xsel
  ];

  # Fonts
  fonts.packages = with pkgs; [
    dina-font
    liberation_ttf
    mplus-outline-fonts.githubRelease
    nerd-fonts.fira-code
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    proggyfonts
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  # Computational Biology Packages (Commented Out)
  # environment.systemPackages = with pkgs; [
  #   bedtools
  #   bioconda
  #   biopython
  #   blast
  #   clustalw
  #   samtools
  # ];

  # Future Categories (Add as needed)
  # environment.systemPackages = with pkgs; [
  #   # Add your future package choices here
  # ];

  # Additional System Configurations (for specific setups)
  # For example, setting environment variables, paths, or special configurations.
}
