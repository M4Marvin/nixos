{ config, pkgs, ... }:

{
  imports = [
    ./lobe-chat.nix
    # ./main-site.nix
    ./cloudflared.nix
    ./nginx.nix
  ];
}
