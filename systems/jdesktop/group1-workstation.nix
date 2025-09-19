{ config, pkgs, ... }:
{
  imports = [
    ./../modules/group1-common.nix
  ];

  # Workstation-specific settings
  networking.hostName = "group1-workstation";

  # User configuration
  users.users.username = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    home = {
      stateVersion = "24.11";
      # Import group1 user config
      extraSpecialArgs = { inherit (self) inputs; };
      file = {
        # Custom dotfile for the workstation
        ".config/something/workstation-config" = {
          text = "Workstation-specific setting";
        };
      };
    };
  };
}
