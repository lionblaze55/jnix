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

  # Enable podman
  virtualisation.podman = {
  enable = true;
  dockerCompat = true;
  };

  # Enable zram swapping on all machines
  zramSwap = {
  enable = true;
  algorithm = "zstd";
  # This refers to the uncompressed size, actual memory usage will be lower.
  memoryPercent = 50;
  };

  # Enable networking.
  networking.networkmanager.enable = true;

  # Set the timezone.
  time.timeZone = "America/New_York";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}

