{ config, pkgs, ... }:

{
  # Set up a common set of packages.
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
  ];

  # Enable networking.
  networking.networkmanager.enable = true;

  # Set the timezone.
  time.timeZone = "America/New_York";
}
