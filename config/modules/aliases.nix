{ config, pkgs, ... }:

{
  environment.shellAliases = {
    cd = "z";
    ls = "lsd";
    l = "lsd -l"; # Long listing
    la = "lsd -la"; # Long listing with hidden files

    # Common NixOS Aliases (Flake versions)
    nixconfig = "nvim /etc/nixos";
    rebuild = "sudo nixos-rebuild switch --flake /etc/nixos";
    upgrade = "sudo nixos-rebuild switch --flake /etc/nixos --upgrade";
    cleanup = "sudo nix-collect-garbage -d";
    hm-rebuild = "home-manager switch --flake /etc/nixos";

    # Common Git Aliases
    g = "git";
    ga = "git add";
    gc = "git commit -m";
    gp = "git push";
    gl = "git pull";
    gs = "git status";
    gb = "git branch";
    gd = "git diff";

    # Other useful aliases
    v = "nvim"; # If you use Neovim
    tree = "lsd --tree";

    # procs instead of ps
    ps = "procs";

    # tldr instead of man
    man = "tldr";
  };
}
