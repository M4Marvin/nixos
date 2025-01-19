{ config, pkgs, ... }:

{
  imports = [
    ./lobe-chat.nix
    ./cloudflared.nix
    ./nginx.nix
    # ./desktop.nix
  ];
}
