{ pkgs, ... }:

{
  services = {
    flatpak.enable = true;
    dbus.enable = true;
    picom.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Core System Tools
    bat
    bottom
    curl
    git
    libsecret
    lshw
    neofetch
    pciutils
    tree
    unzip
    vim
    wget
    which
    xdg-utils

    # Development Tools
    gh
    gitui
    home-manager
    httpie
    nixfmt-classic
    rustfmt
    ruff
    ruff-lsp
    gopls
    shellcheck
    vscode

    # Docker & Web
    bun
    deno
    docker
    nginx
    nodejs

    # File Management
    lsd
    yazi

    # Fonts
    nerd-fonts.fira-code

    # Gaming
    protonplus
    (lutris.override {
      extraPkgs = pkgs: [ wineWowPackages.stable winetricks ];
    })

    # Languages & Package Managers
    conda
    go
    uv
    rustc
    rustup
    cargo

    # Networking
    blueman
    cloudflared
    rustdesk

    # Search Tools
    fzf
    ripgrep
    zoxide

    # Shells
    fish
    nushell

    # System Customization
    latte-dock

    # Terminal
    ghostty
    neovim
    sl
    zellij

    # Utilities
    xsel
    vulkan-tools
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
    remotePlay.openFirewall =
      true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall =
      true; # Open ports in the firewall for Source Dedicated Server
    extraPackages = [ pkgs.proton-ge-bin ];
    protontricks.enable = true;
    gamescopeSession.enable = true;
  };

  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true; # Critical for NVIDIA
  };
}
