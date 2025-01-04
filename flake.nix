{
  description = "My NIXOS Config using Flakes and Home-Manager. @m4marvin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

   outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations.marvin = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./config/configuration.nix
        home-manager.nixosModules.home-manager
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