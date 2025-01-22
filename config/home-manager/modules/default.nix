{ config, pkgs, ... }: {
  imports = [
    ./ghostty.nix
    ./fish.nix
    # ./vim.nix
    ./nixvim.nix
  ];
}