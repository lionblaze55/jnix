{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix #
      ../../modules/common
      ../../modules/desktop
      ../../modules/jfaber
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
