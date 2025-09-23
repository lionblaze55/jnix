{ config, pkgs, ... }:
{
  imports = [
    ./../modules/jfaber-common.nix
  ];

  # Workstation-specific settings
  networking.hostName = "jdesktop";

  # User configuration
  users.users.username = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    home = "/home/jfaber";
  };  
}
