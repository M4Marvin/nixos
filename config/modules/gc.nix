{ config, lib, pkgs, ... }:

{
  # Enable automatic garbage collection
  nix.gc = {
    automatic = true; # Enable automatic garbage collection
    dates = "weekly"; # Run garbage collection weekly
    options = "--delete-older-than 7d"; # Delete store paths older than 7 days
  };

  # Keep a minimum of 3 generations
  nix.extraOptions = ''
    min-free = ${toString (100 * 1024 * 1024)} # Keep at least 100MB free
    max-free = ${toString (1024 * 1024 * 1024)} # Keep up to 1GB free
    keep-outputs = true # Keep outputs of derivations
    keep-derivations = true # Keep derivations of builds
    min-keep = 3 # Keep at least 3 generations
  '';

  # Optimize the Nix store by hard-linking duplicate files
  nix.settings.auto-optimise-store = true;
}