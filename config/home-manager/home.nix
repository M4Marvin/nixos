{ pkgs, ... }:

{
  imports = [
    # Add your Home Manager configurations here
    (pkgs.callPackage ./home-manager/fish-shell.nix { })
  ];
}