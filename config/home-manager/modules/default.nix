{ config, pkgs, ... }: {
  imports = [
    ./ghostty.nix
    ./fish.nix
    # ./vim.nix
    ./desktop
    ./nixvim.nix
  ];
}
