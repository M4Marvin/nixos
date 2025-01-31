{ config, pkgs, ... }: {
  imports = [
    ./ghostty.nix
    ./fish.nix
    # ./vim.nix
    ./desktop.nix
    ./nixvim.nix
    ./waybar.nix
  ];
}
