{ config, pkgs, ... }:

{
  # Set up a common set of packages.
  environment.systemPackages = with pkgs; [
    git
    stow
    vim
    distrobox
    wget
    curl
    htop
  ];

  settings.experimental-features = [ "nix-command" "flakes" ];
  # Enable podman
  virtualisation.podman = {
  enable = true;
  dockerCompat = true;
  };

  # Enable networking.
  networking.networkmanager.enable = true;

  # Set the timezone.
  time.timeZone = "America/New_York";
}
