{
  description = "My NIXOS Config using Flakes and Home-Manager. @m4marvin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
        url = "github:nix-community/nixvim";
        # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
        inputs.nixpkgs.follows = "nixpkgs";
    };

  };

   outputs = { self, nixpkgs, home-manager, nix-ld, nixvim }: {
    nixosConfigurations.marvin = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./config/configuration.nix
        home-manager.nixosModules.home-manager
        nix-ld.nixosModules.nix-ld

        { programs.nix-ld.dev.enable = true; }
      ];
      specialArgs = { inherit home-manager; };
    };

    homeConfigurations.marvin = home-manager.lib.homeManagerConfiguration {
      modules = [ ./config/home-manager/home.nix ];
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = { inherit self nixpkgs home-manager; };
    };
  };
}