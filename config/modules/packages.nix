{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    vscode
    curl
    git
    libsecret
    bun
    xdg-utils
    rustdesk
  ];
}