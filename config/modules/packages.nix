{ pkgs, ... }:

{
  
  environment.systemPackages = with pkgs; [
    home-manager
    # General System Packages
    vim
    fish
    nushell
    tree
    wget
    curl
    git
    libsecret
    xdg-utils
    rustdesk

    # Terminal
    ghostty

    # Languages
    go
    conda
    uv

    # Web Dev
    vscode
    bun
    nodejs
    httpie
    docker
    nginx
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
}