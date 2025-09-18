{
  description = "A multi-host Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    # Define NixOS systems
    nixosConfigurations = {
      "group1-workstation" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/group1-workstation.nix
          home-manager.nixosModules.home-manager
        ];
      };
      "group1-laptop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/group1-laptop.nix
          home-manager.nixosModules.home-manager
        ];
      };
      "group2-workstation" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/group2-workstation.nix
          home-manager.nixosModules.home-manager
        ];
      };
      "group2-laptop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/group2-laptop.nix
          home-manager.nixosModules.home-manager
        ];
      };
      "tv-x86" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/tv-x86.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}
