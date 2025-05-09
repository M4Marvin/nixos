{ pkgs, ... }:

{
  services = {
    flatpak.enable = true;
    dbus.enable = true;
    # picom.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Core System Tools
    bat
    bottom
    glances
    procs
    curl
    git
    libsecret
    lshw
    neofetch
    pciutils
    tree
    unzip
    p7zip
    vim
    wget
    which
    xdg-utils
    zoxide

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
    wireplumber
    wofi
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin

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
    starship

    # Shells
    fish
    nushell

    # System Customization
    hyprland
    rofi
    hyprlock
    eww
    swaybg
    pulseaudioFull

    # Terminal
    ghostty
    # neovim
    sl
    zellij
    jq
    dust
    tldr

    # Utilities
    xsel
    vulkan-tools
    obsidian
    vlc
    ffmpeg-full
    wireplumber
    obs-studio
    tigervnc
    wf-recorder
    v4l-utils
    wl-clipboard
    unrar
  ];

  # Computational Biology Packages
  # environment.systemPackages = with pkgs; [
  #   biopython
  #   blastL
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

  programs.hyprland.enable = true;
}
