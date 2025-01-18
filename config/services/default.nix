{ config, pkgs, ... }:

{
  imports = [
    ./lobe-chat.nix
    # ./cloudflared.nix
    # ./desktop.nix
  ];
}
