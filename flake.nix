{
  description = "A multi-host Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05"";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    # Define NixOS systems
    nixosConfigurations = {
      "jdesktop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/jdesktop/jdesktop.nix
          home-manager.nixosModules.home-manager
        ];
      };
      "jlaptop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/jlaptop/jlaptop.nix
          home-manager.nixosModules.home-manager
        ];
      };
      "edesktop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/edesktop/edesktop.nix
          home-manager.nixosModules.home-manager
        ];
      };
      "elaptop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/elaptop/elaptop.nix
          home-manager.nixosModules.home-manager
        ];
      };
      "jtv" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/jtv/jtv.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}
