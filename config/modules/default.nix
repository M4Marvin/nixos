{ config, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./desktop.nix
    ./networking.nix
    ./packages.nix
    ./users.nix
    ./power.nix
    ./gc.nix
    ./nvidia.nix
  ];
}
