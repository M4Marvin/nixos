{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    {
      nixosConfigurations.my-config = {
        system = {
          build = {
            # Add any build options here if needed
          };
          # Add any other system configurations here
        };
        config = { config, pkgs, ... }:
          {
            imports = [ ./config/nixos/configuration.nix ];

            # Bootloader.
            boot.loader.systemd-boot.enable = true;
            boot.loader.efi.canTouchEfiVariables = true;

            # Timezone and Locale
            time.timeZone = "Asia/Kolkata";
            i18n.defaultLocale = "en_IN";
            i18n.extraLocaleSettings = {
              LC_ADDRESS = "en_IN";
              LC_IDENTIFICATION = "en_IN";
              LC_MEASUREMENT = "en_IN";
              LC_MONETARY = "en_IN";
              LC_NAME = "en_IN";
              LC_NUMERIC = "en_IN";
              LC_PAPER = "en_IN";
              LC_TELEPHONE = "en_IN";
              LC_TIME = "en_IN";
            };

            system.stateVersion = "24.11";
          };
      };
    };
}