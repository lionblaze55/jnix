{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix #
      ./../../modules/jfaber-common.nix
    ];

  # ... (other system configurations)

  users.users.jfaber = {
    isNormalUser = true;
    description = "Joshua Faber";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # #TODO removed until understood better! Home Manager configuration for the user
  #home-manager.users.jfaber = {
  #  home.stateVersion = "25.05";
  #  imports = [
  #    ./../modules/jfaber-common.nix # A shared module
  #    #./homemanager/discord.nix     # Host-specific sub-config for Discord
  #    ./homemanager/sway.nix        # Host-specific sub-config for Sway
  #    ./homemanager/waybar.nix        # Host-specific sub-config for waybar
  #    # Add other host-specific Home Manager configs here
  #  ];
  #};

  # ... (other system configurations)
}
