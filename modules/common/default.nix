{ config, pkgs, ... }:

{

  imports =
    [
      ./maintenance.nix # default settings to keep nixos running smoothly
    ];

  # Set up a common set of packages.
  environment.systemPackages = with pkgs; [
    curl
    distrobox
    firefox
    git
    htop
    stow
    vim
    wget
  ];

  # Enable podman
  virtualisation.podman = {
  enable = true;
  dockerCompat = true;
  };

  # enable gamemode
  programs.gamemode.enable = true;

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

