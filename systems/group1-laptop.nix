{ config, pkgs, ... }:
{
  imports = [
    ./../modules/group1-common.nix
  ];

  networking.hostName = "group1-laptop";

  # Laptop-specific settings
  services.tlp.enable = true; # Example: power management

  # User configuration
  users.users.username = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    home = {
      stateVersion = "24.11";
      extraSpecialArgs = { inherit (self) inputs; };
      file = {
        # Custom dotfile for the laptop
        ".config/something/laptop-config" = {
          text = "Laptop-specific setting";
        };
      };
    };
  };
}
