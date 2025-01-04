{ config, pkgs, ... }: {
  imports = [
    ./ghostty.nix
    ./fish.nix
  ];
}