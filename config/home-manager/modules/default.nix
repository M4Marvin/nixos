{ config, pkgs, ... }: {
  imports = [
    ./ghostty.nix
    ./fish.nix
    ./vim.nix
    ./cloudflared.nix
  ];
}