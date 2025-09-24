{
  description = "A multi-host Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    # TODO removing home manager for now
    #home-manager = {
    #  url = "github:nix-community/home-manager";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs = { self, nixpkgs, ... }: {
    # Define NixOS systems
    nixosConfigurations = {
      "jdesktop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/jdesktop/configuration.nix
          # home-manager.nixosModules.home-manager
        ];
      };
      "jlaptop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/jlaptop/configuration.nix
        ];
      };
      "edesktop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/edesktop/configuration.nix
        ];
      };
      "elaptop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/elaptop/configuration.nix
        ];
      };
      "jtv" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/jtv/configuration.nix
        ];
      };
    };
  };
}
